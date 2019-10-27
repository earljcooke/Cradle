package com.mercury.TeamMercuryCradlePlatform.model;

import javax.persistence.*;

@Entity
@Table(name = "supervisor")
public class SupervisorPatientPair {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "pair_id")
    private Integer pairId;
    private String supervisorId = null;
    private String patientId = null;

    public SupervisorPatientPair(String supervisorId, String patientId) {
        this.supervisorId = supervisorId;
        this.patientId = patientId;
    }

    public Integer getPairId() {
        return pairId;
    }

    public void setPairId(Integer pairId) {
        this.pairId = pairId;
    }

    public String getSupervisorId() {
        return supervisorId;
    }

    public void setSupervisorId(String supervisorId) {
        this.supervisorId = supervisorId;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }
}
