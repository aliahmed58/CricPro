package org.example.Utility;

public class TeamStatNode extends OverallTeam implements Comparable<TeamStatNode> {

    private String type;
    private TeamStatNode next;
    private TeamStatNode prev;

    public TeamStatNode( int mat, int won, int lost, int tied, int draw, int NR, double winLossRatio, String type) {
        super( mat, won, lost, tied, draw, NR, winLossRatio);
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public TeamStatNode getNext() {
        return next;
    }

    public void setNext(TeamStatNode next) {
        this.next = next;
    }

    public TeamStatNode getPrev() {
        return prev;
    }

    public void setPrev(TeamStatNode prev) {
        this.prev = prev;
    }

    @Override
    public int compareTo(TeamStatNode object) {
        return this.type.compareTo(object.type);
    }

    @Override
    public String toString() {
        return super.toString() + "\n" + "TeamStatNode{" +
                "type='" + type + '\'' +
                '}';
    }
}

