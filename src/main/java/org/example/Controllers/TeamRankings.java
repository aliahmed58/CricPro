package org.example.Controllers;

import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;
import javafx.scene.layout.TilePane;
import javafx.scene.layout.VBox;
import org.example.App;
import org.example.DAO.TeamsDAO;
import org.example.DataStructures.HashTable;
import org.example.Utility.Team;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.ResourceBundle;


public class TeamRankings implements Initializable {

    // NON-FXML variables
    static TeamsDAO teamsDAO;
    private static HashTable<Team> teams;
    static Task<HashTable<Team>> task;

    static Team selectedTeam;

    //FXML variables
    @FXML
    private TilePane tilePane;

    //CSS styles

    static {
        teams = Home.getTeams();
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        createWidgets();
    }

    public void createWidgets() {
        if (!teams.isEmpty())
            setTeams();
    }

    //dynamically create widgets and add them to the TilePane
    public void setTeams() {

        for (int i = 1; i < teams.getSize(); i++) {
            if (teams.get(i) != null) {
                VBox child = new VBox();
                child.setAlignment(Pos.CENTER);
                child.setSpacing(10.0);
                child.setLayoutX(596);
                child.setPrefHeight(153);
                child.setPrefWidth(282);
                child.getStyleClass().add("selectPlayer");
                child.setId(teams.get(i).getName());

                String image_path = String.valueOf(getClass().getResource("/org/example/teams/" + teams.get(i).getImage()));
                ImageView flag = new ImageView(image_path);
                flag.setFitHeight(104.0);
                flag.setFitWidth(132);
                flag.setPickOnBounds(true);
                flag.setPreserveRatio(true);

                Label title = new Label(teams.get(i).getName());
                title.setPrefWidth(150);
                title.setAlignment(Pos.CENTER);
                title.getStyleClass().add("selectPlayerName");

                child.getChildren().addAll(flag, title);

                int finalI = i;
                child.setOnMouseClicked(e -> {
                    selectedTeam = teams.get(finalI);
                    try {
                        App.setRoot("teamStat");

                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                });

                tilePane.getChildren().add(child);
            }
        }
    }
}

