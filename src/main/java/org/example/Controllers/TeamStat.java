package org.example.Controllers;

import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.control.ContentDisplay;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.TilePane;
import org.example.DAO.TeamsDAO;
import org.example.DataStructures.LinkedList;
import org.example.DataStructures.Node;
import org.example.Utility.OverallTeam;
import org.example.Utility.Team;
import org.example.Utility.TeamStatNode;

import java.net.URL;
import java.util.ResourceBundle;

public class TeamStat implements Initializable {

    private static TeamsDAO teamsDAO = Home.teamsDAO;
    private Team team = TeamRankings.selectedTeam;
    private Task<LinkedList<TeamStatNode>> task;
    private LinkedList<TeamStatNode> list;
    private OverallTeam overallStats;

    @FXML private Label teamTitle;
    @FXML private ImageView teamImage;

    @FXML Label overallMat;
    @FXML Label overallWon;
    @FXML Label overallLost;
    @FXML Label overallTied;
    @FXML Label overallDraw;
    @FXML Label overallNr;
    @FXML Label overallWLratio;

    @FXML
    ScrollPane scrollPane;

    @FXML
    TilePane tilePane;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        // set basic team data (name, image which was selected from pervious screen)
        setTeam();
        createStatsList();
    }

    public void setTeam() {
        teamTitle.setText(team.getName());
        String path = String.valueOf(getClass().getResource("/org/example/teams/" + team.getImage()));
        teamImage.setImage(new Image(path));
    }

    public void createStatsList() {
        task = new Task<LinkedList<TeamStatNode>>() {
            @Override
            protected LinkedList<TeamStatNode> call() throws Exception {
                return teamsDAO.getTeamStats(team.getName().trim());
            }
        };

        Thread x = new Thread(task);
        x.setDaemon(true);
        x.start();

        task.setOnSucceeded(e -> {
            list = task.getValue();
            setStats();
            setAverageStats();
//            System.out.println(list);
        });

        task.setOnFailed(e -> {
            e.getSource().getException().printStackTrace();
        });
    }

    public void setStats() {

        overallStats = team.getOverallStats(list);

        overallMat.setText(String.valueOf(overallStats.getMat()));
        overallWon.setText(String.valueOf(overallStats.getWon()));
        overallLost.setText(String.valueOf(overallStats.getLost()));
        overallDraw.setText(String.valueOf(overallStats.getDraw()));
        overallTied.setText(String.valueOf(overallStats.getTied()));
        overallNr.setText(String.valueOf(overallStats.getNR()));
        overallWLratio.setText(String.valueOf(overallStats.getWinLossRatio()));
    }

    public void setAverageStats() {
        for (Node<TeamStatNode> i = list.getHead(); i != null; i = i.next) {
            if (i.getItem().getType().equals("overall")) continue;
            HBox child = new HBox();
            child.setPrefWidth(1151);
            child.setPrefHeight(46);
            child.setSpacing(70);
            child.setAlignment(Pos.CENTER_LEFT);
            child.getStyleClass().add("overallHboxFigures");

            Label type = new Label(i.getItem().getType());
            type.setAlignment(Pos.CENTER);
            type.setContentDisplay(ContentDisplay.CENTER);
            type.setPrefHeight(20);
            type.setPrefWidth(174);
            type.getStyleClass().add("heading");
            type.getStyleClass().add("type");


            Label mat = new Label(String.valueOf(i.getItem().getMat()));
            mat.setAlignment(Pos.CENTER);
            mat.setContentDisplay(ContentDisplay.CENTER);
            mat.setPrefHeight(20);
            mat.setPrefWidth(42);
            mat.getStyleClass().add("heading");

            Label won = new Label(String.valueOf(i.getItem().getWon()));
            won.setAlignment(Pos.CENTER);
            won.setContentDisplay(ContentDisplay.CENTER);
            won.setPrefHeight(72);
            won.setPrefWidth(45);
            won.getStyleClass().add("heading");

            Label loss = new Label(String.valueOf(i.getItem().getLost()));
            loss.setAlignment(Pos.CENTER);
            loss.setContentDisplay(ContentDisplay.CENTER);
            loss.setPrefHeight(20);
            loss.setPrefWidth(55);
            loss.getStyleClass().add("heading");

            Label tied = new Label(String.valueOf(i.getItem().getTied()));
            tied.setAlignment(Pos.CENTER);
            tied.setContentDisplay(ContentDisplay.CENTER);
            tied.setPrefHeight(20);
            tied.setPrefWidth(57);
            tied.getStyleClass().add("heading");

            Label draw = new Label(String.valueOf(i.getItem().getDraw()));
            draw.setAlignment(Pos.CENTER);
            draw.setContentDisplay(ContentDisplay.CENTER);
            draw.setPrefHeight(20);
            draw.setPrefWidth(102);
            draw.getStyleClass().add("heading");

            Label NR = new Label(String.valueOf(i.getItem().getNR()));
            NR.setAlignment(Pos.CENTER);
            NR.setContentDisplay(ContentDisplay.CENTER);
            NR.setPrefHeight(20);
            NR.setPrefWidth(46);
            NR.getStyleClass().add("heading");

            Label WLratio = new Label(String.valueOf(i.getItem().getWinLossRatio()));
            WLratio.setAlignment(Pos.CENTER);
            WLratio.setContentDisplay(ContentDisplay.CENTER);
            WLratio.setPrefHeight(20);
            WLratio.setPrefWidth(175);
            WLratio.getStyleClass().add("heading");

            child.getChildren().addAll(type, mat, won, loss, tied, draw, NR, WLratio);

            tilePane.getChildren().add(child);


        }
    }


}
