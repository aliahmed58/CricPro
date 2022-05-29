package org.example.Controllers;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.ResourceBundle;

import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Rectangle2D;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;
import javafx.stage.Screen;
import javafx.stage.Stage;
import org.example.App;
import org.example.DAO.PlayerDAO;
import org.example.DAO.TeamsDAO;
import org.example.DataStructures.HashTable;
import org.example.Helper.FontLoader;
import org.example.Utility.Player;
import org.example.Utility.Team;

public class Home implements Initializable {
    @FXML
    private BorderPane borderPane;
    @FXML
    private Label cricProTitle;
    @FXML
    private Label homepageLabel;
    @FXML
    private Label banner;
    @FXML
    private GridPane buttonContainer;

    static TeamsDAO teamsDAO;
    static HashTable<Team> teams;
    static Task<HashTable<Team>> task;

    static PlayerDAO playerDAO;
    static HashTable<Player> players = new HashTable<>(30);
    private static Task<HashTable<Player>> getPlayers;

    static {
        try {
            teamsDAO = new TeamsDAO();
            playerDAO = new PlayerDAO();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        getPlayers = new Task<HashTable<Player>>() {
            @Override
            protected HashTable<Player> call() throws Exception {
                players = playerDAO.getBasicData();
                return players;
            }
        };

        Thread x = new Thread(getPlayers);
        x.setDaemon(true);
        x.start();

        task = new Task<>() {
            @Override
            protected HashTable<Team> call() throws Exception {
                teams = teamsDAO.getTeams();
                return teams;
            }
        };
        Thread th = new Thread(task);
        th.setDaemon(true);
        th.start();

        task.setOnSucceeded(e -> {
            teams = task.getValue();
        });

        getPlayers.setOnSucceeded(e -> {
            players = getPlayers.getValue();
        });
    }


    @Override
    public void initialize(URL url, ResourceBundle resourceBundle)  {

        this.setButtonListeners();

        Rectangle2D screenBounds = Screen.getPrimary().getBounds();
        borderPane.setPrefSize(screenBounds.getWidth(), screenBounds.getHeight());

        buttonContainer.setPrefSize((borderPane.getWidth() / 2), borderPane.getHeight());

        Font bold = FontLoader.getFont("bold.ttf", 30);
        cricProTitle.setFont(bold);

        Font medium = FontLoader.getFont("medium.ttf", 30);
        homepageLabel.setFont(medium);

        Font regular = FontLoader.getFont("regular.ttf", 30);
        banner.setFont(regular);
    }

    public void setButtonListeners() {
        for (int i = 0; i < buttonContainer.getChildren().size(); i++) {
            if (buttonContainer.getChildren().get(i) instanceof Button) {
                Button button = (Button) buttonContainer.getChildren().get(i);
                button.setOnMouseClicked(mouseEvent -> {
                    try {
                        App.setRoot(button.getId());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                });
            }
        }
    }


    public static HashTable<Player> getPlayers() {
        return players;
    }

    public static HashTable<Team> getTeams() {
        return teams;
    }
}
