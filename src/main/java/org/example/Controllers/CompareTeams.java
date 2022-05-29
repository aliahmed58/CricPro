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
import org.example.Utility.Team;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.ResourceBundle;

public class CompareTeams implements Initializable {

    @FXML
    private TilePane tilePane;
    @FXML
    private Button nextBtn;
    @FXML
    private Label error;

    static HashTable<Team> teams;
    static ArrayList<CheckBox> activeBoxes = new ArrayList<>();

    static {
        teams = Home.getTeams();
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        if (!teams.isEmpty()) setTeams();
        proceedNext();
    }

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

                CheckBox checkBox = new CheckBox(teams.get(i).getName());
                checkBox.setPrefWidth(150);
                checkBox.setAlignment(Pos.CENTER);
                checkBox.getStyleClass().add("selectPlayerName");
                checkBox.setId(teams.get(i).getName());
                checkBox.setUserData(teams.get(i));

                // setting checkbox properties so only 2 can be selected at a time
                checkBox.selectedProperty().addListener((o, oldV, newV) -> {
                    if (newV) {
                        activeBoxes.add(checkBox);
                        if (activeBoxes.size() > 2) {
                            checkBox.setSelected(false);
                        }
                    } else
                        activeBoxes.remove(checkBox);
                });

                child.getChildren().addAll(flag, checkBox);

                tilePane.getChildren().add(child);
            }
        }
    }

    public void proceedNext() {

        nextBtn.setOnMouseClicked(e -> {
            if (activeBoxes.size() < 2) {
                error.setText("Please select two teams!");
            } else {
                try {
                    App.setRoot("tvtTeam");
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
        });
    }

    public static ArrayList<CheckBox> getActiveBoxes() {
        return activeBoxes;
    }
}
