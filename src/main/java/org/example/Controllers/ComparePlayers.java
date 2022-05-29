package org.example.Controllers;


import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;
import javafx.scene.layout.TilePane;
import javafx.scene.layout.VBox;
import org.example.App;
import org.example.DataStructures.HashTable;
import org.example.Utility.Player;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.ResourceBundle;

public class ComparePlayers implements Initializable {

    static HashTable<Player> players;
    //TODO: Add a dynamic array instead
    static ArrayList<CheckBox> activeBoxes = new ArrayList<>();

    @FXML
    TilePane tilePane;
    @FXML
    Button nextBtn;
    @FXML Label error;

    static {
        players = Home.getPlayers();
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        setPlayers();
        proceedNext();
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

                CheckBox checkBox = new CheckBox(players.get(i).getPlayerName());
                checkBox.getStyleClass().add("selectPlayerName");
                checkBox.setUserData(players.get(i));
                // setting checkbox properties so only 2 can be selected at a time
                checkBox.selectedProperty().addListener((o, oldV, newV) -> {
                    if (newV) {
                        activeBoxes.add(checkBox);
                        if (activeBoxes.size() > 2)
                            checkBox.setSelected(false);
                    } else
                        activeBoxes.remove(checkBox);
                });

                child.getChildren().addAll(imageView, checkBox);

                tilePane.getChildren().add(child);
            }
        }
    }

    public void proceedNext() {
        nextBtn.setOnMouseClicked(e -> {
            if (activeBoxes.size() < 2) {
                error.setText("Please select two players!");
            }
            else {
                try {
                    App.setRoot("pvpPlayer");
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        });
    }
}
