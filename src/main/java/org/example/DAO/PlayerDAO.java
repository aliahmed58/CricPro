package org.example.DAO;

import org.example.DataStructures.HashTable;
import org.example.DataStructures.LinkedList;
import org.example.Database.DataSource;
import org.example.Utility.Player;
import org.example.Utility.PlayerStatNode;
import org.example.Utility.TeamStatNode;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

public class PlayerDAO {

    public static int count;

    private Connection conn;

    public PlayerDAO() {
        try {
            this.conn = DataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getRowCount() throws SQLException {
        try (PreparedStatement pst = conn.prepareStatement("SELECT COUNT(*) AS TOTAL FROM PLAYERS")) {
            ResultSet rs = pst.executeQuery();
            count = 0;
            while (rs.next()) {
                count = rs.getInt("total");
            }
            return count;
        }
    }

    public HashTable<Player> getBasicData() throws SQLException {
        try(PreparedStatement pst = conn.prepareStatement("SELECT * FROM PLAYERS")) {

            count = this.getRowCount();
            ResultSet rs = pst.executeQuery();
            HashTable<Player> players = new HashTable<>(count);
            while (rs.next()) {
                Player player = new Player(
                        rs.getInt("player_id"),
                        rs.getString("name"),
                        rs.getString("team"),
                        rs.getInt("age"),
                        rs.getString("role"),
                        rs.getString("batting_hand"),
                        rs.getString("bowling_hand"),
                        rs.getString("bowling_type"),
                        rs.getString("career_span"),
                        rs.getString("img")
                        );
                players.insert(player, rs.getInt("player_id"));
            }
            return players;
        }
    }

    public LinkedList<PlayerStatNode> getPlayerStats(String name) throws SQLException {
        try (PreparedStatement pst = conn.prepareStatement("SELECT * FROM player_stats where player = ?")) {
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();
            LinkedList<PlayerStatNode> list = new LinkedList<>();
            while (rs.next()) {
                PlayerStatNode node = new PlayerStatNode(
                        rs.getInt("mat"),
                        rs.getInt("runs"),
                        rs.getInt("hs"),
                        rs.getDouble("bat_av"),
                        rs.getInt("hundreds"),
                        rs.getInt("wkts"),
                        rs.getDouble("bowl_av"),
                        rs.getInt("ct"),
                        rs.getInt("st"),
                        rs.getString("grouping")
                );
                list.insert(node);
            }
            return list;
        }
    }

}
