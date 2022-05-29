package org.example.Controllers;

import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.VBox;
import org.example.DAO.TeamsDAO;
import org.example.DataStructures.LinkedList;
import org.example.DataStructures.Node;
import org.example.Utility.Team;
import org.example.Utility.TeamStatNode;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class TvTTeam implements Initializable {

    Task<LinkedList<TeamStatNode>> task1;
    Task<LinkedList<TeamStatNode>> task2;

    ArrayList<CheckBox> checkBoxes = new ArrayList<>();
    Team[] compareTeams = new Team[2]; // since 2 teams are being compared

    boolean[] team1Comparisons = new boolean[8];
    boolean[] team2Comparisons = new boolean[8];

    double[] arr1 = new double[8];
    double[] arr2 = new double[8];

    LinkedList<TeamStatNode> team1Stats;
    LinkedList<TeamStatNode> team2Stats;

    static TeamsDAO teamsDAO;

    @FXML
    ImageView team1;
    @FXML
    ImageView team2;
    @FXML
    Label team2Title;
    @FXML
    Label team1Title;
    @FXML
    Label team1th;
    @FXML
    Label team2th;
    @FXML
    VBox team1Vbox;
    @FXML
    VBox team2Vbox;

    static {
        teamsDAO = Home.teamsDAO;
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        setBasicData();
        setTeam2Stats();
    }

    public void setCompareTeams() {
        compareTeams[0] = (Team) CompareTeams.activeBoxes.get(0).getUserData();
        compareTeams[1] = (Team) CompareTeams.activeBoxes.get(1).getUserData();

        //clear checkbox choices
        CompareTeams.activeBoxes.clear();
    }

    public void setBasicData() {
        setCompareTeams();
        team1Title.setText(compareTeams[0].getName());
        team2Title.setText(compareTeams[1].getName());

        team1th.setText(compareTeams[0].getName());
        team2th.setText(compareTeams[1].getName());

        Image image1 = new Image(String.valueOf(getClass().getResource("/org/example/teams/" + compareTeams[0].getImage())));
        Image image2 = new Image(String.valueOf(getClass().getResource("/org/example/teams/" + compareTeams[1].getImage())));
        team1.setImage(image1);
        team2.setImage(image2);
    }


    public void setTeam1Stats() {
        task1 = new Task<>() {
            @Override
            protected org.example.DataStructures.LinkedList<TeamStatNode> call() throws Exception {
                return teamsDAO.getTeamStats(compareTeams[0].getName().trim());
            }
        };

        Thread x = new Thread(task1);
        x.setDaemon(true);
        x.start();
        task1.setOnSucceeded(e -> {
            team1Stats = task1.getValue();
            this.fillDataArrays(team1Stats, arr1);
            compareData();
            setResults();
        });
    }

    public void setTeam2Stats() {
        task2 = new Task<>() {
            @Override
            protected org.example.DataStructures.LinkedList<TeamStatNode> call() throws Exception {
                return teamsDAO.getTeamStats(compareTeams[1].getName().trim());
            }
        };

        Thread x = new Thread(task2);
        x.setDaemon(true);
        x.start();
        task2.setOnSucceeded(e -> {
            team2Stats = task2.getValue();
            this.fillDataArrays(team2Stats, arr2);
            setTeam1Stats();
        });
    }

    public void fillDataArrays(LinkedList<TeamStatNode> list, double[] arr) {
        for (Node<TeamStatNode> n = list.getHead(); n != null; n = n.next) {
            String type = n.getItem().getType();
            if (type.equals("overall")) {
                arr[0] = n.getItem().getWinLossRatio();
            } else if (type.equals("Twenty20 Internationals")) {
                arr[1] = n.getItem().getWinLossRatio();
            } else if (type.equals("Test matches"))
                arr[2] = n.getItem().getWinLossRatio();
            else if (type.equals("One-Day Internationals"))
                arr[3] = n.getItem().getWinLossRatio();
            else if (type.equals("World Cup"))
                arr[4] = n.getItem().getWinLossRatio();
            else if (type.equals("Men's T20 World Cup"))
                arr[5] = n.getItem().getWinLossRatio();
            if (type.equals("home"))
                arr[6] = n.getItem().getWinLossRatio();
            if (type.equals("away"))
                arr[7] = n.getItem().getWinLossRatio();
        }
    }


    public void compareData() {
        for (int i = 0; i < arr1.length; i++) {
            if (arr1[i] > arr2[i]) {
                team1Comparisons[i] = true;
            } else team2Comparisons[i] = true;
        }
    }

    public void setResults() {

        System.out.println(arr1.length == arr2.length);

        for (int i = 0; i < arr1.length; i++) {

            Image down = new Image(String.valueOf(getClass().getResource("/org/example/util/false.png")));
            Image up = new Image(String.valueOf(getClass().getResource("/org/example/util/true.png")));

            ImageView team1 = new ImageView();
            team1.setFitHeight(35);
            team1.setFitWidth(50);
            team1.setPreserveRatio(true);

            ImageView team2 = new ImageView();
            team2.setFitHeight(35);
            team2.setFitWidth(50);
            team2.setPreserveRatio(true);

            if (team1Comparisons[i]) {
                team1.setImage(up);
            }else {
                team1.setImage(down);
            }
            if (team2Comparisons[i]) {
                team2.setImage(up);
            }else {
                team2.setImage(down);
            }

            team1Vbox.getChildren().add(team1);
            team2Vbox.getChildren().add(team2);
        }
        team1Vbox.setSpacing(13);
        team2Vbox.setSpacing(13);
    }

}
