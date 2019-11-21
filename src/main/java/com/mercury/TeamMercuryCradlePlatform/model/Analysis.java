package com.mercury.TeamMercuryCradlePlatform.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.ZonedDateTime;

@Entity
@Table(name = "analysis")
public class Analysis {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "analysis_id")
    public Long analysisId;

    @OneToOne
    @JoinColumn(name = "reading_id")
    private Reading reading;

    @OneToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @Column(name = "date_time_created")
    private ZonedDateTime dateTimeCreated = ZonedDateTime.now();

    @Column(name = "isGreen")
    private Boolean isGreen = false;

    @Column(name = "isYellow")
    private Boolean isYellow = false;

    @Column(name = "isRed")
    private Boolean isRed = false;

    @Column(name = "arrowUp")
    private Boolean arrowUp = false;

    @Column(name = "arrowDown")
    private Boolean arrowDown = false;

    public Analysis(){}

    public Analysis(Reading reading){
        this.reading = reading;
        if (this.reading != null) {
            setParameters();
        }
    }

    private void setParameters() {
        ReadingAnalysis readingAnalysis = ReadingAnalysis.analyze(reading);
        this.isGreen = readingAnalysis.isGreen();
        this.isYellow = readingAnalysis.isYellow();
        this.isRed = readingAnalysis.isRed();
        this.arrowUp = readingAnalysis.isUp();
        this.arrowDown = readingAnalysis.isDown();
        this.patient = this.reading.getPatient();
        this.dateTimeCreated = this.reading.getDateTimeTaken();
    }

    public Long getAnalysisId() {
        return analysisId;
    }

    public Boolean getGreen() {
        return isGreen;
    }

    public Boolean getYellow() {
        return isYellow;
    }

    public Boolean getRed() {
        return isRed;
    }

    public Boolean getArrowUp() {
        return arrowUp;
    }

    public Boolean getArrowDown() {
        return arrowDown;
    }

    public Reading getReading() {
        return reading;
    }

    public void setReading(Reading reading) {
        this.reading = reading;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public ZonedDateTime getDateTimeCreated() {
        return dateTimeCreated;
    }
}
