package org.example.Utility;

import org.example.DataStructures.LinkedList;
import org.example.DataStructures.Node;

public class Team implements Comparable<Team> {

    private int team_id;
    private String name;
    private String image;
    private OverallTeam overallStats;

    public Team(int team_id, String name, String img_url) {
        this.name = name;
        this.team_id = team_id;
        this.image = img_url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getTeam_id() {
        return team_id;
    }

    public void setTeam_id(int team_id) {
        this.team_id = team_id;
    }

    @Override
    public String toString() {
        return "Team{" +
                "team_id=" + team_id +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                '}';
    }

    @Override
    public int compareTo(Team o) {
        return this.name.compareTo(o.name);
    }

    public OverallTeam getOverallStats(LinkedList<TeamStatNode> list) {
        for (Node<TeamStatNode> node = list.getHead(); node != null; node = node.next) {
            if (node.getItem().getType().equals("overall")) {
                overallStats = new OverallTeam(
                        node.getItem().getMat(),
                        node.getItem().getWon(),
                        node.getItem().getLost(),
                        node.getItem().getTied(),
                        node.getItem().getDraw(),
                        node.getItem().getNR(),
                        node.getItem().getWinLossRatio()
                );
                break;
            }
        }
        return overallStats;
    }

}

