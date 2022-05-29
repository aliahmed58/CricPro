package org.example.Controllers;

import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.VBox;
import org.example.DAO.PlayerDAO;
import org.example.DataStructures.LinkedList;
import org.example.DataStructures.Node;
import org.example.Utility.Player;
import org.example.Utility.PlayerStatNode;

import java.net.URL;
import java.util.ResourceBundle;

public class PvPPlayer implements Initializable {

    Player[] comparePlayers = new Player[2]; // since 2 teams are being compared

    boolean[] player1Comparisons = new boolean[8];
    boolean[] player2Comparisons = new boolean[8];

    double[] arr1 = new double[8];
    double[] arr2 = new double[8];

    LinkedList<PlayerStatNode> player1Stats;
    LinkedList<PlayerStatNode> player2Stats;

    static PlayerDAO playerDAO;

    @FXML
    ImageView player1;
    @FXML ImageView player2;
    @FXML
    Label player1Title;
    @FXML Label player2Title;
    @FXML
    Label player1th;
    @FXML
    Label player2th;
    @FXML
    VBox team1Vbox;
    @FXML
    VBox team2Vbox;

    static {
        playerDAO = Home.playerDAO;
    }


    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        setBasicData();
        setTeam2Stats();
    }


    public void setCompareTeams() {
        comparePlayers[0] =(Player) ComparePlayers.activeBoxes.get(0).getUserData();
        comparePlayers[1] = (Player) ComparePlayers.activeBoxes.get(1).getUserData();

        //clear checkbox choices
        ComparePlayers.activeBoxes.clear();
    }

    public void setBasicData() {
        setCompareTeams();
        player1Title.setText(comparePlayers[0].getPlayerName());
        player2Title.setText(comparePlayers[1].getPlayerName());

        Image image1 = new Image(String.valueOf(getClass().getResource("/org/example/players/" + comparePlayers[0].getImg())));
        Image image2 = new Image(String.valueOf(getClass().getResource("/org/example/players/" + comparePlayers[1].getImg())));
        player1.setImage(image1);
        player2.setImage(image2);

        player1th.setText(comparePlayers[0].getPlayerName());
        player2th.setText(comparePlayers[1].getPlayerName());

    }

    public void setTeam1Stats() {
        Task<LinkedList<PlayerStatNode>> task1 = new Task<>() {
            @Override
            protected LinkedList<PlayerStatNode> call() throws Exception {
                return playerDAO.getPlayerStats(comparePlayers[0].getPlayerName().trim());
            }
        };

        Thread x = new Thread(task1);
        x.setDaemon(true);
        x.start();
        task1.setOnSucceeded(e -> {
            player1Stats = task1.getValue();
            comparePlayers[0].setStats(player1Stats);
            this.fillDataArrays(comparePlayers[0].getStats(), arr1);
            compareData();
            setResults();
        });
    }

    public void setTeam2Stats() {
        Task<LinkedList<PlayerStatNode>> task2 = new Task<>() {
            @Override
            protected LinkedList<PlayerStatNode> call() throws Exception {
                return playerDAO.getPlayerStats(comparePlayers[1].getPlayerName().trim());
            }
        };

        Thread x = new Thread(task2);
        x.setDaemon(true);
        x.start();
        task2.setOnSucceeded(e -> {
            player2Stats = task2.getValue();
            comparePlayers[1].setStats(player2Stats);
            this.fillDataArrays(comparePlayers[1].getStats(), arr2);
            setTeam1Stats();
        });
    }

    //todo: better comparison scheme
    public void fillDataArrays(LinkedList<PlayerStatNode> list, double[] arr) {
        for (Node<PlayerStatNode> n = list.getHead(); n != null; n = n.next) {
            String type = n.getItem().getType();
            if (type.equals("overall")) {
                arr[0] = n.getItem().getRuns();
            } else if (type.equals("matches batting first")) {
                arr[1] = n.getItem().getRuns();
            } else if (type.equals("matches fielding first"))
                arr[2] = n.getItem().getRuns();
            else if (type.equals("Test matches"))
                arr[3] = n.getItem().getRuns();
            else if (type.equals("One-Day Internationals"))
                arr[4] = n.getItem().getRuns();
            else if (type.equals("World Cup"))
                arr[5] = n.getItem().getRuns();
            if (type.equals("home"))
                arr[6] = n.getItem().getRuns();
            if (type.equals("away"))
                arr[7] = n.getItem().getRuns();
        }
    }

    public void compareData() {
        for (int i = 0; i < arr1.length; i++) {
            if (arr1[i] > arr2[i]) {
                player1Comparisons[i] = true;
            } else player2Comparisons[i] = true;
        }
    }

    public void setResults() {

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

            if (player1Comparisons[i]) {
                team1.setImage(up);
            }else {
                team1.setImage(down);
            }
            if (player2Comparisons[i]) {
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
