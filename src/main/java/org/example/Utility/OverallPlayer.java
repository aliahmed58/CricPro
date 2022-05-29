package org.example.Utility;

import org.example.DataStructures.LinkedList;

public class OverallPlayer {

    private int mat;
    private int runs;
    private int HS;
    private double batAvg;
    private int hundreds;
    private int wickets;
    private double bowlAvg;
    private double Ct;
    private double St;

    public OverallPlayer(int mat, int runs, int HS, double batAvg, int hundreds, int wickets, double bowlAvg, double ct, double st) {
        this.mat = mat;
        this.runs = runs;
        this.HS = HS;
        this.batAvg = batAvg;
        this.hundreds = hundreds;
        this.wickets = wickets;
        this.bowlAvg = bowlAvg;
        Ct = ct;
        St = st;
    }

    public int getMat() {
        return mat;
    }

    public void setMat(int mat) {
        this.mat = mat;
    }

    public int getRuns() {
        return runs;
    }

    public void setRuns(int runs) {
        this.runs = runs;
    }

    public int getHS() {
        return HS;
    }

    public void setHS(int HS) {
        this.HS = HS;
    }

    public double getBatAvg() {
        return batAvg;
    }

    public void setBatAvg(double batAvg) {
        this.batAvg = batAvg;
    }

    public int getHundreds() {
        return hundreds;
    }

    public void setHundreds(int hundreds) {
        this.hundreds = hundreds;
    }

    public int getWickets() {
        return wickets;
    }

    public void setWickets(int wickets) {
        this.wickets = wickets;
    }


    public double getBowlAvg() {
        return bowlAvg;
    }

    public void setBowlAvg(double bowlAvg) {
        this.bowlAvg = bowlAvg;
    }


    public double getCt() {
        return Ct;
    }

    public void setCt(double ct) {
        Ct = ct;
    }

    public double getSt() {
        return St;
    }

    public void setSt(double st) {
        St = st;
    }




    @Override
    public String toString() {
        return "OverallPlayer{" +
                "mat=" + mat +
                ", runs=" + runs +
                ", HS=" + HS +
                ", batAvg=" + batAvg +
                ", hundreds=" + hundreds +
                ", wickets=" + wickets +
                ", bowlAvg=" + bowlAvg +
                ", Ct=" + Ct +
                ", St=" + St +
                '}';
    }
}
