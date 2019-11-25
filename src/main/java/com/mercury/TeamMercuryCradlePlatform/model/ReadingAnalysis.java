package com.mercury.TeamMercuryCradlePlatform.model;


import com.mercury.TeamMercuryCradlePlatform.Strings;

/**
 * Analyzes a single reading and generates advice for this reading.
 * If analyzing a sequence of readings (retests), use ReadingRetestAnalysis
 */


public enum ReadingAnalysis  {
    // Enum Types
    NONE(Strings.ANALYSIS_NONE, Strings.BRIEF_ADVICE_NONE),
    GREEN(Strings.ANALYSIS_GREEN, Strings.BRIEF_ADVICE_GREEN),
    YELLOW_UP(Strings.ANALYSIS_YELLOW_UP, Strings.BRIEF_ADVICE_YELLOW_UP),
    YELLOW_DOWN(Strings.ANALYSIS_YELLOW_DOWN, Strings.BRIEF_ADVICE_YELLOW_DOWN),
    RED_UP(Strings.ANALYSIS_RED_UP, Strings.BRIEF_ADVICE_RED_UP),
    RED_DOWN(Strings.ANALYSIS_RED_DOWN, Strings.BRIEF_ADVICE_RED_DOWN);

    // Break points for determining Green/Yellow/Red Up/Down
    // source: CRADLE VSA Manual (extracted spring 2019)
    private static final int RED_SYSTOLIC = 160;
    private static final int RED_DIASTOLIC = 110;
    private static final int YELLOW_SYSTOLIC = 140;
    private static final int YELLOW_DIASTOLIC = 90;
    private static final double SHOCK_HIGH = 1.7;
    private static final double SHOCK_MEDIUM = 0.9;

    public static final int MAX_SYSTOLIC = 300;
    public static final int MIN_SYSTOLIC = 10;
    public static final int MAX_DIASTOLIC = 300;
    public static final int MIN_DIASTOLIC = 10;
    public static final int MAX_HEART_RATE = 200;
    public static final int MIN_HEART_RATE = 40;

    private final String analysisText;
    private final String briefText;


    ReadingAnalysis(String none, String none1) {
        this.analysisText = none;
        this.briefText = none1;
    }

    public String getAnalysisText(){
        return  analysisText;
    }

    public String getBriefText(){
        return briefText;
    }


    public boolean isUp() {
        return this == YELLOW_UP || this == RED_UP;
    }
    public boolean isDown() {
        return this == YELLOW_DOWN || this == RED_DOWN;
    }
    public boolean isGreen() {
        return this == GREEN;
    }
    public boolean isYellow() {
        return this == YELLOW_UP|| this == YELLOW_DOWN;
    }
    public boolean isRed() {
        return this == RED_UP || this == RED_DOWN;
    }

    // Analysis Functions
    public static ReadingAnalysis analyze(Reading r) {
        // Guard no currentReading:
        if (r.bpSystolic == null || r.bpDiastolic == null || r.heartRateBPM == null) {
            return NONE;
        }

        double shockIndex = getShockIndex(r);

        boolean isBpVeryHigh = (r.bpSystolic >= RED_SYSTOLIC) || (r.bpDiastolic >= RED_DIASTOLIC);
        boolean isBpHigh = (r.bpSystolic >= YELLOW_SYSTOLIC) || (r.bpDiastolic >= YELLOW_DIASTOLIC);
        boolean isSevereShock = (shockIndex >= SHOCK_HIGH);
        boolean isShock = (shockIndex >= SHOCK_MEDIUM);

        // Return analysis based on priority:
        ReadingAnalysis analysis;
        if (isSevereShock) {
            analysis = RED_DOWN;
        } else if (isBpVeryHigh) {
            analysis = RED_UP;
        } else if (isShock) {
            analysis = YELLOW_DOWN;
        } else if (isBpHigh) {
            analysis = YELLOW_UP;
        } else {
            analysis = GREEN;
        }
        return analysis;
    }


    private static double getShockIndex(Reading r) {
        // Div-zero guard:
        if (r.bpSystolic == null || r.bpSystolic == 0) {
            return 0;
        }
        return (double) r.heartRateBPM / (double) r.bpSystolic;
    }

    public boolean isReferralToHealthCentreRecommended() {
        return (this == YELLOW_UP)
                || (this == RED_UP)
                || (this == RED_DOWN);
    }

    public String getTrafficLightImg(){

        if(this.isGreen()){
            return "status_green";
        }
        else if(this.isYellow()){
            return "status_yellow";
        }
        else if(this.isRed()){
            return "status_red";
        }

        return null;
    }

    public String getArrowDirection(){

        if(this.isUp()){
            return "arrow_up";
        }
        if(this.isDown()){
            return "arrow_down";
        }

        return null;
    }
}
