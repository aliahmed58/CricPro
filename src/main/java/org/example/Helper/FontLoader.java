package org.example.Helper;

import javafx.scene.text.Font;
import org.example.App;

public class FontLoader {

    public static Font getFont(String fontName, double size) {
        return Font.loadFont(App.class.getResourceAsStream("font/" + fontName), size);
    }
}
