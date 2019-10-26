package com.mercury.TeamMercuryCradlePlatform.model;

import javax.persistence.*;
import javax.persistence.Entity;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Patient {
    private static final short ATTESTATION_ID_LENGTH = 11;
    private static final String NOT_APPLICABLE = "NA";

    @Id
    @Column(name="patient_ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long patientID;

    private String attestationID = null;
    private String firstName = null;
    private String lastName = null;
    private Integer ageYears = null;
    private String country = null;
    private String location = null;


    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name="patient_Id", referencedColumnName = "patient_Id")
    private List<Reading> readings = new ArrayList<>();

    @OneToOne(mappedBy = "patient", cascade = CascadeType.ALL)
    private Referral referral;

    public Patient() {
    }

    public Patient(String attestationID, String firstName, String lastName, String country, String location) {
        setAttestationID(attestationID);
        setFirstName(firstName);
        setLastName(lastName);
        setCountry(country);
        setLocation(location);
    }

    // TODO: dont really need this, delete it later
    public Patient(Reading reading) {
        this.firstName = reading.firstName;
        this.lastName = reading.lastName;
        this.ageYears = reading.ageYears;

        this.readings.add(reading);
    }

    public void updatePatient(Patient patient) {
        setAttestationID(patient.getAttestationID());
        setFirstName(patient.getFirstName());
        setLastName(patient.getLastName());
        setCountry(patient.getCountry());
        setLocation(patient.getLocation());
    }


    public void addReading(Reading reading){
        this.readings.add(reading);
    }

    // Ideas used from https://www.baeldung.com/java-pad-string
    private String padLeftZeros(String attestationID) {
        StringBuilder sb = new StringBuilder();
        while (sb.length() < ATTESTATION_ID_LENGTH - attestationID.length()) {
            sb.append('0');
        }
        sb.append(attestationID);

        return sb.toString();
    }

    public Long getPatientID(){
        return patientID;
    }
    public String getAttestationID() {
        return attestationID;
    }
    public String getCountry() {
        return country;
    }

    public String getLocation() {
        return location;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public Integer getAgeYears() {
        return ageYears;
    }

    public void setPatientID(Long patientID) {
        this.patientID = patientID;
    }
    public void setAttestationID(String attestationID) {
//        if (attestationID.length() < ATTESTATION_ID_LENGTH) {
//            System.out.println("less");
//            attestationID = padLeftZeros(attestationID);
//        } else if (attestationID.length() > ATTESTATION_ID_LENGTH) {
//            attestationID = NOT_APPLICABLE;
//        }
        if (attestationID.length() == ATTESTATION_ID_LENGTH) {
            this.attestationID = attestationID;
            return;
        }
        this.attestationID = NOT_APPLICABLE;
    }
    public void setAgeYears(Integer ageYears) {
        this.ageYears = ageYears;
    }
    public void setCountry(String country) {
        this.country = country;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public void addReading(Reading reading){
        this.readings.add(reading);
    }


    public Referral getReferral() {
        return referral;
    }

    public void setReferral(Referral referral) {
        this.referral = referral;
    }


}