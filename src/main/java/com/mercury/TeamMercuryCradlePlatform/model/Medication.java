package com.mercury.TeamMercuryCradlePlatform.model;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "medication")
public class Medication {
    @Id
    @Column(name="medication_Id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long medicationId;

    //  Medication: date started, date discontinued, dose, side effects
    private String medicationName = null;
    private LocalDate startDate = LocalDate.now();
    private LocalDate finishDate = LocalDate.now();
    private Integer periodOfConsumption = 0;
    private String doseUnits = null;
    private String sideEffects = null;
    private Double dose = .0;
    private Long patientId = null;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "assessment_Id", referencedColumnName = "assessment_Id")
    private Assessment assessment;

    public Medication(){}

    public Medication(String medicationName, Integer periodOfConsumption, String sideEffects, String doseUnits, Double dose) {
        this.medicationName = medicationName;
        this.periodOfConsumption = periodOfConsumption;
        this.sideEffects = sideEffects;
        this.dose = dose;
        this.doseUnits = doseUnits;
    }

    public String getDoseUnits() {
        return doseUnits;
    }

    public void setDoseUnits(String doseUnits) {
        this.doseUnits = doseUnits;
    }

    public Long getMedicationId() {
        return medicationId;
    }

    public void setMedicationId(Long medicationId) {
        this.medicationId = medicationId;
    }

    public String getMedicationName() {
        return medicationName;
    }

    public void setMedicationName(String medicationName) {
        this.medicationName = medicationName;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(LocalDate finishDate) {
        this.finishDate = finishDate;
    }

    public String getSideEffects() {
        return sideEffects;
    }

    public void setSideEffects(String sideEffects) {
        this.sideEffects = sideEffects;
    }

    public Double getDose() {
        return dose;
    }

    public void setDose(Double dose) {
        this.dose = dose;
    }

    public Assessment getAssessment() {
        return assessment;
    }

    public void setAssessment(Assessment assessment) {
        this.assessment = assessment;
    }

    public Integer getPeriodOfConsumption() {
        return periodOfConsumption;
    }

    public void setPeriodOfConsumption(Integer periodOfConsumption) {
        this.periodOfConsumption = periodOfConsumption;
    }

    public void calculateFinishDate (){
        this.finishDate = this.startDate.plusDays(periodOfConsumption);
    }

    public Long getPatientId() {
        return patientId;
    }

    public void setPatientId(Long patientId) {
        this.patientId = patientId;
    }
}
