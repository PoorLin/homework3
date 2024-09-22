package com.systex.homework3.model;

public class GuessGame {
    private int remains;

    private int luckyNumber;

    public int getLuckyNumber() {
        return luckyNumber;
    }

    public void setLuckyNumber(int luckyNumber) {
        this.luckyNumber = luckyNumber;
    }

    public GuessGame() {
    }

    public GuessGame(int range, int luckyNumber) {
        this.remains = 3;
        this.luckyNumber = luckyNumber;
    }

    public int getRemains(){
        return this.remains;
    }
    public boolean guess(int number){
        if(number == this.luckyNumber){
            return true;
        }else {
            this.remains = getRemains()-1;
            return false;
        }
    }


    @Override
    public String toString() {
        return "GuessGame{" +
                "remains=" + remains +
                ", luckyNumber=" + luckyNumber +
                '}';
    }
}
