package com.mercury.TeamMercuryCradlePlatform.model;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.ZonedDateTime;

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
    private ZonedDateTime dateTimeSent = ZonedDateTime.now();

    @Column(name = "vht_name")
    private String vhtName = null;

    @Column(name = "reason_of_referral")
    private String reasonOfReferral = null;

    @Column(name = "action_already_taken")
    private String actionAlreadyTaken = null;


    @Column(name = "other_information_message")
    private String otherInformationMessage = null;

    //reading info
    @OneToOne
    @JoinColumn(name = "referral_id")
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

    public void setIsPregnant(Boolean isPregnant) {
        this.isPregnant = isPregnant;
    }


    @Column(name = "bp_systolic")
    private Integer bpSystolic = 0;

    @Column(name = "bp_diastolic")
    private Integer bpDiastolic = 0;

    @Column(name = "heart_rate_bpm")
    private Integer heartRateBPM = 0;

    // patient info
    @OneToOne
    @JoinColumn(name = "referral_id")
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

    @Column(name = "sex")
    private Sex sex = Sex.FEMALE;

    @Column(name = "zone_number")
    private Integer zoneNumber = 0;


    @Column(name = "village_number")
    private Integer villageNumber = 0;

    @Column(name = "isPregnant")
    private Boolean isPregnant = true;


    public Referral() {
    }

    public Referral(String firstName, String lastName, Integer ageYears, Sex sex, String vhtName, String referredHealthCentre, Integer bpSystolic, Integer bpDiastolic, Integer heartRateBPM) {
        this.referredHealthCentre = referredHealthCentre;
        this.vhtName = vhtName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.ageYears = ageYears;
        this.sex = sex;
        this.bpSystolic = bpSystolic;
        this.bpDiastolic = bpDiastolic;
        this.heartRateBPM = heartRateBPM;
    }

    public Referral(String firstName, String lastName, Integer ageYears, Sex sex, String vhtName, String referredHealthCentre, Integer bpSystolic, Integer bpDiastolic, Integer heartRateBPM, ZonedDateTime dateTimeSent) {
        this.referredHealthCentre = referredHealthCentre;
        this.vhtName = vhtName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.ageYears = ageYears;
        this.sex = sex;
        this.bpSystolic = bpSystolic;
        this.bpDiastolic = bpDiastolic;
        this.heartRateBPM = heartRateBPM;
        this.dateTimeSent = dateTimeSent;
    }

    public Referral(String referredHealthCentre,
                    ZonedDateTime dateTimeSent,
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
                    Integer villageNumber) {
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
        this.villageNumber = villageNumber;
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

    public ZonedDateTime getDateTimeSent() {
        return dateTimeSent;
    }

    public void setDateTimeSent(ZonedDateTime dateTimeSent) {
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

    public Integer getVillageNumber() {
        return villageNumber;
    }

    public void setVillageNumber(Integer villageNumber) {
        this.villageNumber = villageNumber;
    }

}
