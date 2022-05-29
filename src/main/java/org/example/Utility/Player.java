package org.example.Utility;

import org.example.DataStructures.LinkedList;
import org.example.DataStructures.Node;

public class Player implements Comparable<Player> {

    private LinkedList<PlayerStatNode> stats;
    private int player_id;
    private String playerName;
    private String team;
    private int age;
    private String role;
    private String battingHand;
    private String bowlingHand;
    private String bowlingType;
    private String careerSpan;
    private String img;
    private OverallPlayer overallStats;

    public Player(int player_id, String playerName, String team, int age, String role, String battingHand, String bowlingHand, String bowlingType, String careerSpan, String img) {
        this.player_id = player_id;
        this.playerName = playerName;
        this.team = team;
        this.age = age;
        this.role = role;
        this.battingHand = battingHand;
        this.bowlingHand = bowlingHand;
        this.bowlingType = bowlingType;
        this.careerSpan = careerSpan;
        this.img = img;
    }

    public LinkedList<PlayerStatNode> getStats() {
        return stats;
    }

    public void setStats(LinkedList<PlayerStatNode> stats) {
        this.stats = stats;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getBattingHand() {
        return battingHand;
    }

    public void setBattingHand(String battingHand) {
        this.battingHand = battingHand;
    }

    public String getBowlingHand() {
        return bowlingHand;
    }

    public void setBowlingHand(String bowlingHand) {
        this.bowlingHand = bowlingHand;
    }

    public String getBowlingType() {
        return bowlingType;
    }

    public void setBowlingType(String bowlingType) {
        this.bowlingType = bowlingType;
    }

    public String getCareerSpan() {
        return careerSpan;
    }

    public void setCareerSpan(String careerSpan) {
        this.careerSpan = careerSpan;
    }


    public OverallPlayer getOverallStats(LinkedList<PlayerStatNode> list) {
        for (Node<PlayerStatNode> node = list.getHead(); node != null; node = node.next) {
            if (node.getItem().getType().equals("overall")) {
                overallStats = new OverallPlayer(
                        node.getItem().getMat(),
                        node.getItem().getRuns(),
                        node.getItem().getHS(),
                        node.getItem().getBatAvg(),
                        node.getItem().getHundreds(),
                        node.getItem().getWickets(),
                        node.getItem().getBowlAvg(),
                        node.getItem().getCt(),
                        node.getItem().getSt()
                );
                break;
            }
        }
        return overallStats;
    }

    @Override
    public String toString() {
        return "Player{" +
                "player_id=" + player_id +
                ", playerName='" + playerName + '\'' +
                '}';
    }

    @Override
    public int compareTo(Player o) {
        return this.playerName.compareTo(o.playerName);
    }
}
