package org.example.Utility;

public class OverallTeam {

    private int mat;
    private int won;
    private int lost;
    private int tied;
    private int draw;
    private int NR;
    private double winLossRatio;

    public OverallTeam( int mat, int won, int lost, int tied, int draw, int NR, double winLossRatio) {
        this.mat = mat;
        this.won = won;
        this.lost = lost;
        this.tied = tied;
        this.draw = draw;
        this.NR = NR;
        this.winLossRatio = winLossRatio;
    }

    public int getMat() {
        return mat;
    }

    public void setMat(int mat) {
        this.mat = mat;
    }

    public int getWon() {
        return won;
    }

    public void setWon(int won) {
        this.won = won;
    }

    public int getLost() {
        return lost;
    }

    public void setLost(int lost) {
        this.lost = lost;
    }

    public int getTied() {
        return tied;
    }

    public void setTied(int tied) {
        this.tied = tied;
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getNR() {
        return NR;
    }

    public void setNR(int NR) {
        this.NR = NR;
    }

    public double getWinLossRatio() {
        return winLossRatio;
    }

    public void setWinLossRatio(double winLossRatio) {
        this.winLossRatio = winLossRatio;
    }

    @Override
    public String toString() {
        return "OverallTeam{" +
                "team=" +
                '}';
    }
}
