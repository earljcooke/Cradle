package com.mercury.TeamMercuryCradlePlatform.model;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "referral")
public class Referral {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "referral_id")
    private Long referralId;

    @Column(name = "referred_health_centre")
    private String referredHealthCentre = null;

    @Column(name = "date_time_sent")
    private LocalDate dateTimeSent = LocalDate.now();

    @Column(name = "vht_name")
    private String vhtName = null;

    @Column(name = "reason_of_referral")
    private String reasonOfReferral = null;

    @Column(name = "action_already_taken")
    private String actionAlreadyTaken = null;


    @Column(name = "other_information_message")
    private String otherInformationMessage = null;

    //reading info
    @OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "reading_id", referencedColumnName = "reading_id")
    private Reading reading;

    public Reading getReading() {
        return reading;
    }

    public Long getReadingId() {
        return reading.getReadingId();
    }

    public void setReading(Reading reading) {
        this.reading = reading;
    }

    @Column(name = "bp_systolic")
    private Integer bpSystolic = 0;

    @Column(name = "bp_diastolic")
    private Integer bpDiastolic = 0;

    @Column(name = "heart_rate_bpm")
    private Integer heartRateBPM = 0;

    // patient info
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "patient_Id", referencedColumnName = "patient_Id")
    private Patient patient;

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "age_years")
    private Integer ageYears;

    public enum Sex {
        FEMALE,
        MALE
    }

    @Column(name = "sex")
    private Sex sex = Sex.FEMALE;

    @Column(name = "zone_number")
    private Integer zoneNumber = 0;

    @Column(name = "block_number")
    private Integer blockNumber = 0;

    @Column(name = "tank_number")
    private Integer tankNumber = 0;

    @Column(name = "village_number")
    private Integer villageNumber = 0;

    @Column(name = "household_number")
    private Integer householdNumber = 0;


    public Referral() {
    }

    public Referral(String firstName, String lastName, Integer ageYears, String vhtName, String referredHealthCentre) {
        this.referredHealthCentre = referredHealthCentre;
        this.vhtName = vhtName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.ageYears = ageYears;
    }


    public Referral(String referredHealthCentre,
                    LocalDate dateTimeSent,
                    String vhtName,
                    String reasonOfReferral,
                    String actionAlreadyTaken,
                    String otherInformationMessage,
                    Integer bpSystolic,
                    Integer bpDiastolic,
                    Integer heartRateBPM,
                    String firstName,
                    String lastName,
                    Integer ageYears,
                    Sex sex,
                    Integer zoneNumber,
                    Integer blockNumber,
                    Integer tankNumber,
                    Integer villageNumber,
                    Integer householdNumber) {
        this.referredHealthCentre = referredHealthCentre;
        this.dateTimeSent = dateTimeSent;
        this.vhtName = vhtName;
        this.reasonOfReferral = reasonOfReferral;
        this.actionAlreadyTaken = actionAlreadyTaken;
        this.otherInformationMessage = otherInformationMessage;
        this.bpSystolic = bpSystolic;
        this.bpDiastolic = bpDiastolic;
        this.heartRateBPM = heartRateBPM;
        this.firstName = firstName;
        this.lastName = lastName;
        this.ageYears = ageYears;
        this.sex = sex;
        this.zoneNumber = zoneNumber;
        this.blockNumber = blockNumber;
        this.tankNumber = tankNumber;
        this.villageNumber = villageNumber;
        this.householdNumber = householdNumber;
    }


    public Long getReferralId() {
        return referralId;
    }

    public void setReferralId(Long referralId) {
        this.referralId = referralId;
    }

    public String getReferredHealthCentre() {
        return referredHealthCentre;
    }

    public void setReferredHealthCentre(String referredHealthCentre) {
        this.referredHealthCentre = referredHealthCentre;
    }

    public LocalDate getDateTimeSent() {
        return dateTimeSent;
    }

    public void setDateTimeSent(LocalDate dateTimeSent) {
        this.dateTimeSent = dateTimeSent;
    }

    public String getVhtName() {
        return vhtName;
    }

    public void setVhtName(String vhtName) {
        this.vhtName = vhtName;
    }

    public String getReasonOfReferral() {
        return reasonOfReferral;
    }

    public void setReasonOfReferral(String reasonOfReferral) {
        this.reasonOfReferral = reasonOfReferral;
    }

    public String getActionAlreadyTaken() {
        return actionAlreadyTaken;
    }

    public void setActionAlreadyTaken(String actionAlreadyTaken) {
        this.actionAlreadyTaken = actionAlreadyTaken;
    }

    public String getOtherInformationMessage() {
        return otherInformationMessage;
    }

    public void setOtherInformationMessage(String otherInformationMessage) {
        this.otherInformationMessage = otherInformationMessage;
    }

    public Integer getBpSystolic() {
        return bpSystolic;
    }

    public void setBpSystolic(Integer bpSystolic) {
        this.bpSystolic = bpSystolic;
    }

    public Integer getBpDiastolic() {
        return bpDiastolic;
    }

    public void setBpDiastolic(Integer bpDiastolic) {
        this.bpDiastolic = bpDiastolic;
    }

    public Integer getHeartRateBPM() {
        return heartRateBPM;
    }

    public void setHeartRateBPM(Integer heartRateBPM) {
        this.heartRateBPM = heartRateBPM;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Integer getAgeYears() {
        return ageYears;
    }

    public void setAgeYears(Integer ageYears) {
        this.ageYears = ageYears;
    }

    public Sex getSex() {
        return sex;
    }

    public void setSex(Sex sex) {
        this.sex = sex;
    }

    public Integer getZoneNumber() {
        return zoneNumber;
    }

    public void setZoneNumber(Integer zoneNumber) {
        this.zoneNumber = zoneNumber;

    }

    public Integer getBlockNumber() {
        return blockNumber;
    }

    public void setBlockNumber(Integer blockNumber) {
        this.blockNumber = blockNumber;
    }

    public Integer getTankNumber() {
        return tankNumber;
    }

    public void setTankNumber(Integer tankNumber) {
        this.tankNumber = tankNumber;
    }

    public Integer getVillageNumber() {
        return villageNumber;
    }

    public void setVillageNumber(Integer villageNumber) {
        this.villageNumber = villageNumber;
    }

    public Integer getHouseholdNumber() {
        return householdNumber;
    }

    public void setHouseholdNumber(Integer householdNumber) {
        this.householdNumber = householdNumber;
    }
}
