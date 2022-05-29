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
import org.example.DAO.PlayerDAO;
import org.example.DataStructures.HashTable;
import org.example.Utility.Player;

import java.io.IOException;
import java.net.URL;
import java.util.Hashtable;
import java.util.ResourceBundle;

public class IndividualStats implements Initializable {

    private static final HashTable<Player> players;

    static Player playerSelected;

    //FXML
    @FXML
    private TilePane tilePane;

    static {
        players = Home.getPlayers();
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        createPlayers();
    }

    public void createPlayers() {
        if (!players.isEmpty())
            setPlayers();
    }

    public void setPlayers() {
        for (int i = 1; i < players.getSize(); i++) {

            if (players.get(i) != null) {
                VBox child = new VBox();
                child.setAlignment(Pos.CENTER);
                child.setPrefHeight(136);
                child.setPrefWidth(258);
                child.setSpacing(10);
                child.getStyleClass().add("selectPlayer");
                child.getStyleClass().add("selectPlayerVbox");

                String path = String.valueOf(getClass().getResource("/org/example/players/" + players.get(i).getImg()));
                ImageView imageView = new ImageView(path);
                imageView.setFitHeight(124);
                imageView.setFitWidth(118);
                imageView.setPickOnBounds(true);
                imageView.setPreserveRatio(true);

                Label text = new Label(players.get(i).getPlayerName());
                text.getStyleClass().add("selectPlayerName");

                child.getChildren().addAll(imageView, text);

                int finalI = i;
                child.setOnMouseClicked(e -> {
                    playerSelected = players.get(finalI);

                    try {
                        App.setRoot("individualStatsSearch");
                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                });
                tilePane.getChildren().add(child);
            }
        }
    }
}
