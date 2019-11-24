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

    @Column(name = "isAssessed")
    private Boolean isAssessed = false;


    public Referral() {
    }

    public Referral(String firstName, String lastName, Integer ageYears, Sex sex, String vhtName, String referredHealthCentre, Integer bpSystolic, Integer bpDiastolic, Integer heartRateBPM) {
        setReferredHealthCentre(referredHealthCentre);
        setVhtName(vhtName);
        setFirstName(firstName);
        setLastName(lastName);
        setAgeYears(ageYears);
        setSex(sex);
        setBpSystolic(bpSystolic);
        setBpDiastolic(bpDiastolic);
        setHeartRateBPM(heartRateBPM);
    }

    public Referral(String firstName, String lastName, Integer ageYears, Sex sex, String vhtName, String referredHealthCentre, Integer bpSystolic, Integer bpDiastolic, Integer heartRateBPM, ZonedDateTime dateTimeSent) {
        setReferredHealthCentre(referredHealthCentre);
        setDateTimeSent(dateTimeSent);
        setVhtName(vhtName);
        setFirstName(firstName);
        setLastName(lastName);
        setAgeYears(ageYears);
        setSex(sex);
        setBpSystolic(bpSystolic);
        setBpDiastolic(bpDiastolic);
        setHeartRateBPM(heartRateBPM);
    }

    public Referral(String firstName,
                    String lastName,
                    Integer ageYears,
                    Sex sex,
                    String vhtName,
                    String referredHealthCentre,
                    Integer bpSystolic,
                    Integer bpDiastolic,
                    Integer heartRateBPM,
                    ZonedDateTime dateTimeSent,
                    Integer zoneNumber,
                    Integer villageNumber,
                    String reasonOfReferral,
                    String actionAlreadyTaken,
                    String otherInformationMessage) {
        setReferredHealthCentre(referredHealthCentre);
        setDateTimeSent(dateTimeSent);
        setVhtName(vhtName);
        setReasonOfReferral(reasonOfReferral);
        setActionAlreadyTaken(actionAlreadyTaken);
        setOtherInformationMessage(otherInformationMessage);
        setBpSystolic(bpSystolic);
        setBpDiastolic(bpDiastolic);
        setHeartRateBPM(heartRateBPM);
        setFirstName(firstName);
        setLastName(lastName);
        setAgeYears(ageYears);
        setSex(sex);
        setZoneNumber(zoneNumber);
        setVillageNumber(villageNumber);
    }


    public Long getReferralId() {
        return referralId;
    }

    public void setReferralId(Long referralId) {
        this.referralId = referralId;
    }

    public String getReferredHealthCentre() {
        if (referredHealthCentre == null) {
            return "None";
        }
        return referredHealthCentre;
    }

    public void setReferredHealthCentre(String referredHealthCentre) {
        if (referredHealthCentre == null) {
            this.referredHealthCentre = "None";
        } else {
            this.referredHealthCentre = referredHealthCentre;
        }
    }

    public ZonedDateTime getDateTimeSent() {
        if (dateTimeSent == null) {
            return ZonedDateTime.now();
        }
        return dateTimeSent;
    }

    public void setDateTimeSent(ZonedDateTime dateTimeSent) {
        this.dateTimeSent = dateTimeSent;
    }

    public String getVhtName() {
        if (vhtName == null) {
            return "None";
        }
        return vhtName;
    }

    public void setVhtName(String vhtName) {
        if (vhtName == null) {
            this.vhtName = "None";
        } else {
            this.vhtName = vhtName;
        }
    }

    public String getReasonOfReferral() {
        if (reasonOfReferral == null) {
            return "None";
        }
        return reasonOfReferral;
    }

    public void setReasonOfReferral(String reasonOfReferral) {
        if (reasonOfReferral == null || reasonOfReferral.isEmpty()) {
            this.reasonOfReferral = "None";
        } else {
            this.reasonOfReferral = reasonOfReferral;
        }
    }

    public String getActionAlreadyTaken() {
        if (actionAlreadyTaken == null) {
            return "None";
        }
        return actionAlreadyTaken;
    }

    public void setActionAlreadyTaken(String actionAlreadyTaken) {
        if (actionAlreadyTaken == null || actionAlreadyTaken.isEmpty()) {
            this.actionAlreadyTaken = "None";
        } else {
            this.actionAlreadyTaken = actionAlreadyTaken;
        }
    }

    public String getOtherInformationMessage() {
        if (otherInformationMessage == null) {
            return "None";
        }
        return otherInformationMessage;
    }

    public void setOtherInformationMessage(String otherInformationMessage) {
        if (otherInformationMessage == null || otherInformationMessage.isEmpty()) {
            this.otherInformationMessage = "None";
        } else {
            this.otherInformationMessage = otherInformationMessage;
        }
    }

    public Integer getBpSystolic() {
        if (bpSystolic == null) {
            return 0;
        }
        return bpSystolic;
    }

    public void setBpSystolic(Integer bpSystolic) {
        if (bpSystolic == null) {
            this.bpSystolic = 0;
        } else {
            this.bpSystolic = bpSystolic;
        }
    }

    public Integer getBpDiastolic() {
        if (bpDiastolic == null) {
            return 0;
        }
        return bpDiastolic;
    }

    public void setBpDiastolic(Integer bpDiastolic) {
        if (bpDiastolic == null) {
            this.bpDiastolic = 0;
        } else {
            this.bpDiastolic = bpDiastolic;
        }
    }

    public Integer getHeartRateBPM() {
        if (heartRateBPM == null) {
            return 0;
        }
        return heartRateBPM;
    }

    public void setHeartRateBPM(Integer heartRateBPM) {
        if (heartRateBPM == null) {
            this.heartRateBPM = 0;
        } else {
            this.heartRateBPM = heartRateBPM;
        }
    }

    public String getFirstName() {
        if (firstName == null) {
            return "None";
        }
        return firstName;
    }

    public void setFirstName(String firstName) {
        if (firstName == null) {
            this.firstName = "None";
        } else {
            this.firstName = firstName;
        }
    }

    public String getLastName() {
        if (lastName == null) {
            return "None";
        }
        return lastName;
    }

    public void setLastName(String lastName) {
        if (lastName == null) {
            this.lastName = "None";
        } else {
            this.lastName = lastName;
        }
    }

    public Integer getAgeYears() {
        if (ageYears == null) {
            return 0;
        }
        return ageYears;
    }

    public void setAgeYears(Integer ageYears) {
        if (ageYears == null) {
            this.ageYears = 0;
        } else {
            this.ageYears = ageYears;
        }
    }

    public Sex getSex() {
        if (sex == null) {
            return Sex.FEMALE;
        }
        return sex;
    }

    public void setSex(Sex sex) {
        if (sex == null) {
            this.sex = Sex.FEMALE;
        } else {
            this.sex = sex;
        }
    }

    public Integer getZoneNumber() {
        if (zoneNumber == null) {
            return 0;
        }
        return zoneNumber;
    }

    public void setZoneNumber(Integer zoneNumber) {
        if (zoneNumber == null) {
            this.zoneNumber = 0;
        } else {
            this.zoneNumber = zoneNumber;
        }
    }

    public Integer getVillageNumber() {
        if (villageNumber == null) {
            return 0;
        }
        return villageNumber;
    }

    public void setVillageNumber(Integer villageNumber) {
        if (villageNumber == null) {
            this.villageNumber = 0;
        } else {
            this.villageNumber = villageNumber;
        }
    }

    public Boolean getIsPregnant() {
        return isPregnant;
    }

    public Boolean getIsAssessed() {
        return isAssessed;
    }

    public void setIsAssessed(Boolean assessed) {
        isAssessed = assessed;
    }
}
