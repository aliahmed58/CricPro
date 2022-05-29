module org.example {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    requires org.postgresql.jdbc;
    requires com.zaxxer.hikari;
    requires cloudinary.http44;
    requires cloudinary.core;

    opens org.example to javafx.fxml;
    exports org.example;
    exports org.example.Controllers;
    opens org.example.Controllers to javafx.fxml;
}
