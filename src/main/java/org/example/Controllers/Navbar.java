package org.example.Controllers;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import org.example.App;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class Navbar implements Initializable {

    @FXML
    private VBox buttonsBox;

    private static final String ONHOVER = "-fx-background-color: #00203F; -fx-text-fill: #ADEFD1;";
    private static final String ONNORMAL = "-fx-text-fill: #00203F; -fx-background-color: #ADEFD1;";

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        this.setButtonProperties();
    }

    public void setButtonProperties() {
        Font ralewayMedium = Font.loadFont(App.class.getResourceAsStream("font/medium.ttf"), 20);
        for (int i = 0; i < buttonsBox.getChildren().size(); i ++) {
            Button x = (Button) buttonsBox.getChildren().get(i);
            x.setOnMouseClicked(mouseEvent -> {
                try {
                    App.setRoot(x.getId());
                }catch (IOException e) {
                    e.printStackTrace();
                }
            });
            x.setOnMouseEntered(e -> x.setStyle(ONHOVER));
            x.setOnMouseExited(e -> x.setStyle(ONNORMAL));
            x.setFont(ralewayMedium);
        }
    }
}
