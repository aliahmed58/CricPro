package org.example.Controllers;

import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.ContentDisplay;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.TilePane;
import org.example.DAO.PlayerDAO;
import org.example.DataStructures.LinkedList;
import org.example.DataStructures.Node;
import org.example.Utility.OverallPlayer;
import org.example.Utility.Player;
import org.example.Utility.PlayerStatNode;
import org.example.Utility.TeamStatNode;

import java.net.URL;
import java.util.ResourceBundle;


public class IndividualStatsSearch implements Initializable {

    private Player player = IndividualStats.playerSelected;
    private OverallPlayer overallStats;
    private Task<LinkedList<PlayerStatNode>> task;
    private LinkedList<PlayerStatNode> list;
    private PlayerDAO playerDAO = Home.playerDAO;

    @FXML Label imgCaption;
    @FXML ImageView image;
    @FXML Label playerName;
    @FXML Label age;
    @FXML Label careerSpan;
    @FXML Label battingStyle;
    @FXML Label bowlingStyle;

    @FXML Label overallMat;
    @FXML Label overallRuns;
    @FXML Label overallHs;
    @FXML Label batAv;
    @FXML Label overallHundreds;
    @FXML Label overallWkts;
    @FXML Label overallBowlAvg;
    @FXML Label overallCt;
    @FXML Label overallSt;
    @FXML
    TilePane tilePane;



    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        setData();
        createStatsList();
    }

    public void setData() {
        String imgCap = player.getPlayerName() + " - " + player.getRole();
        imgCaption.setText(imgCap);
        image.setImage(new Image(String.valueOf(getClass().getResource("/org/example/players/" + player.getImg()))));
        playerName.setText(player.getPlayerName());
        age.setText(String.valueOf(player.getAge()));
        careerSpan.setText(player.getCareerSpan());
        battingStyle.setText(player.getBattingHand());
        bowlingStyle.setText(player.getBowlingHand());
    }

    public void createStatsList() {
        task = new Task<>() {
            @Override
            protected LinkedList<PlayerStatNode> call() throws Exception {
                return playerDAO.getPlayerStats(player.getPlayerName().trim());
            }
        };

        Thread x = new Thread(task);
        x.setDaemon(true);
        x.start();

        task.setOnSucceeded(e -> {
            list = task.getValue();
            setStats();
            setAverageStats();
        });

        task.setOnFailed(e -> {
            e.getSource().getException().printStackTrace();
        });
    }

    public void setStats() {

        overallStats = player.getOverallStats(list);

        overallMat.setText(String.valueOf(overallStats.getMat()));
        overallRuns.setText(String.valueOf(overallStats.getRuns()));
        overallHs.setText(String.valueOf(overallStats.getHS()));
        batAv.setText(String.valueOf(overallStats.getBatAvg()));
        overallHundreds.setText(String.valueOf(overallStats.getHundreds()));
        overallWkts.setText(String.valueOf(overallStats.getWickets()));
        overallBowlAvg.setText(String.valueOf(overallStats.getBowlAvg()));
        overallCt.setText(String.valueOf(overallStats.getCt()));
        overallSt.setText(String.valueOf(overallStats.getSt()));
    }

    public void setAverageStats() {
        for (Node<PlayerStatNode> i = list.getHead(); i != null; i = i.next) {
            if (i.getItem().getType().equals("overall")) continue;

            HBox child = new HBox();
            child.setPrefWidth(1151);
            child.setPrefHeight(46);
            child.setSpacing(70);
            child.setAlignment(Pos.CENTER_LEFT);
            child.getStyleClass().add("overallHboxFigures");
            child.setPadding(new Insets(0, 20, 0, 20));

            Label type = new Label(i.getItem().getType());
            type.setAlignment(Pos.CENTER);
            type.setContentDisplay(ContentDisplay.CENTER);
            type.setPrefHeight(20);
            type.setPrefWidth(206);
            type.getStyleClass().add("playerStatFig");

            Label mat = new Label(String.valueOf(i.getItem().getMat()));
            mat.setAlignment(Pos.CENTER);
            mat.setContentDisplay(ContentDisplay.CENTER);
            mat.setPrefHeight(20);
            mat.setPrefWidth(58 );
            mat.getStyleClass().add("playerStatFig");

            Label runs = new Label(String.valueOf(i.getItem().getRuns()));
            runs.setAlignment(Pos.CENTER);
            runs.setContentDisplay(ContentDisplay.CENTER);
            runs.setPrefHeight(20);
            runs.setPrefWidth(98);
            runs.getStyleClass().add("playerStatFig");

            Label hs = new Label(String.valueOf(i.getItem().getHS()));
            hs.setAlignment(Pos.CENTER);
            hs.setContentDisplay(ContentDisplay.CENTER);
            hs.setPrefHeight(18);
            hs.setPrefWidth(58);
            hs.getStyleClass().add("playerStatFig");

            Label batAvg = new Label(String.valueOf(i.getItem().getBatAvg()));
            batAvg.setAlignment(Pos.CENTER);
            batAvg.setContentDisplay(ContentDisplay.CENTER);
            batAvg.setPrefHeight(20);
            batAvg.setPrefWidth(73);
            batAvg.getStyleClass().add("playerStatFig");

            Label hundreds = new Label(String.valueOf(i.getItem().getHundreds()));
            hundreds.setAlignment(Pos.CENTER);
            hundreds.setContentDisplay(ContentDisplay.CENTER);
            hundreds.setPrefHeight(20);
            hundreds.setPrefWidth(56);
            hundreds.getStyleClass().add("playerStatFig");

            Label wkts = new Label(String.valueOf(i.getItem().getWickets()));
            wkts.setAlignment(Pos.CENTER);
            wkts.setContentDisplay(ContentDisplay.CENTER);
            wkts.setPrefHeight(20);
            wkts.setPrefWidth(58);
            wkts.getStyleClass().add("playerStatFig");

            Label bowlAvg = new Label(String.valueOf(i.getItem().getBowlAvg()));
            bowlAvg.setAlignment(Pos.CENTER);
            bowlAvg.setContentDisplay(ContentDisplay.CENTER);
            bowlAvg.setPrefHeight(20);
            bowlAvg.setPrefWidth(75);
            bowlAvg.getStyleClass().add("playerStatFig");

            Label CT = new Label(String.valueOf(i.getItem().getCt()));
            CT.setAlignment(Pos.CENTER);
            CT.setContentDisplay(ContentDisplay.CENTER);
            CT.setPrefHeight(20);
            CT.setPrefWidth(62);
            CT.getStyleClass().add("playerStatFig");

            Label st = new Label(String.valueOf(i.getItem().getSt()));
            st.setAlignment(Pos.CENTER);
            st.setContentDisplay(ContentDisplay.CENTER);
            st.setPrefHeight(20);
            st.setPrefWidth(59);
            st.getStyleClass().add("playerStatFig");


            child.getChildren().addAll(type,mat, runs, hs, batAvg, hundreds, wkts, bowlAvg, CT, st);

            tilePane.getChildren().add(child);
        }
    }
}
