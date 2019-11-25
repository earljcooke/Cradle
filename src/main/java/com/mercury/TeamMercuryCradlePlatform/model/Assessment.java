package com.mercury.TeamMercuryCradlePlatform.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "assessment")
public class Assessment {
    @Id
    @Column(name="assessment_Id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long assessmentId;

    @Column(name="diagnosis",columnDefinition="LONGTEXT")
    private String diagnosis = null;
    @Column(name="notes",columnDefinition="TEXT")
    private String notes = null;
    private LocalDate dateCreated = LocalDate.now();

    //reading info
    @OneToOne
    @JoinColumn(name = "referral_id")
    private Referral referral;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "assessment")
//    @JoinColumn(name="medication_Id", referencedColumnName = "medication_Id")
    private List<Medication> medications = new ArrayList<>();

    public Assessment(){}

    public Assessment(String diagnosis, String notes, List<Medication> medications) {
        this.diagnosis = diagnosis;
        this.notes = notes;
        this.medications = medications;
    }

    public Long getAssessmentId() {
        return assessmentId;
    }

    public void setAssessmentId(Long assessmentId) {
        this.assessmentId = assessmentId;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public LocalDate getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(LocalDate dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Referral getReferral() {
        return referral;
    }

    public void setReferral(Referral referral) {
        this.referral = referral;
    }

    public List<Medication> getMedications() {
        return medications;
    }

    public void setMedications(List<Medication> medications) {
        this.medications = medications;
    }

    public void addMedication(Medication medication){
        this.medications.add(medication);
    }

    public void addAllMedications(List<Medication> medicationList){
        this.medications.addAll(medicationList);
    }
}
