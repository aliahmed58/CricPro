package org.example.Utility;

public class PlayerStatNode extends OverallPlayer implements Comparable<PlayerStatNode> {

    private String type;
    private PlayerStatNode next;
    private PlayerStatNode prev;

    public PlayerStatNode(int mat, int runs, int HS, double batAvg, int hundreds, int wickets, double bowlAvg, double ct, double st, String type) {
        super(mat, runs, HS, batAvg, hundreds, wickets, bowlAvg, ct, st);
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public PlayerStatNode getNext() {
        return next;
    }

    public void setNext(PlayerStatNode next) {
        this.next = next;
    }

    public PlayerStatNode getPrev() {
        return prev;
    }

    public void setPrev(PlayerStatNode prev) {
        this.prev = prev;
    }

    @Override
    public int compareTo(PlayerStatNode o) {
        return this.type.compareTo(o.type);
    }
}
