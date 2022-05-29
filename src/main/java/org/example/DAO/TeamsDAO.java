package org.example.DAO;

import org.example.DataStructures.HashTable;
import org.example.DataStructures.LinkedList;
import org.example.Database.DataSource;
import org.example.Utility.Team;
import org.example.Utility.TeamStatNode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

public class TeamsDAO {

    private Connection conn;

    public TeamsDAO() throws SQLException {
        this.conn = DataSource.getConnection();
    }

    public int getRowCount() throws SQLException {
        try (PreparedStatement pst = conn.prepareStatement("SELECT COUNT(*) AS TOTAL FROM TEAMS")) {
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt("total");
            }
            return count;
        }
    }

    public HashTable<Team> getTeams() throws SQLException {
        try (PreparedStatement pst = conn.prepareStatement("SELECT * FROM TEAMS")) {

            int count = this.getRowCount();

            ResultSet rs = pst.executeQuery();
            HashTable<Team> teams = new HashTable<>(count);

            while (rs.next()) {
                teams.insert(new Team(rs.getInt("team_id"), rs.getString("name"), rs.getString("img")), rs.getInt("team_id"));
            }
            return teams;
        }
    }

    public Team getSingleTeam(String teamName) throws SQLException {
        try (PreparedStatement pst = conn.prepareStatement("SELECT * FROM TEAMS WHERE NAME = ?")) {
            pst.setString(1, teamName);
            ResultSet rs = pst.executeQuery();
            Team result = new Team(0, null, null);
            while (rs.next()) {
                result = new Team(
                        rs.getInt("team_id"),
                        rs.getString("name"),
                        rs.getString("img"));
            }

            return result;
        }
    }

    public LinkedList<TeamStatNode> getTeamStats(String team) throws SQLException {
        try (PreparedStatement pst = conn.prepareStatement("SELECT * FROM team_stats where team = ?")) {
            pst.setString(1, team);
            ResultSet rs = pst.executeQuery();
            LinkedList<TeamStatNode> list = new LinkedList<>();
            while (rs.next()) {
                TeamStatNode node = new TeamStatNode(
                        rs.getInt("mat"),
                        rs.getInt("won"),
                        rs.getInt("lost"),
                        rs.getInt("tied"),
                        rs.getInt("draw"),
                        rs.getInt("nr"),
                        rs.getDouble("wlratio"),
                        rs.getString("grouping")
                );
                list.insert(node);
            }
            return list;
        }
    }
}
