package com.mercury.TeamMercuryCradlePlatform.model;

public class VHTPair {
    private String firstVHT = null;
    private String secondVHT = null;

    public VHTPair(String firstVHT, String secondVHT) {
        this.firstVHT = firstVHT;
        this.secondVHT = secondVHT;
    }

    public void setFirstVHT(String firstVHT) {
        this.firstVHT = firstVHT;
    }

    public void setSecondVHT(String secondVHT) {
        this.secondVHT = secondVHT;
    }

    public String getSecondVHT() {
        return secondVHT;
    }

    public String getFirstVHT() {
        return firstVHT;
    }
}
