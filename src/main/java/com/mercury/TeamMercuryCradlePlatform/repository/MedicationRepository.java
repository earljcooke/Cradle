package com.mercury.TeamMercuryCradlePlatform.repository;

import com.mercury.TeamMercuryCradlePlatform.model.Assessment;
import com.mercury.TeamMercuryCradlePlatform.model.Medication;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MedicationRepository extends CrudRepository<Medication, Long> {
    public List<Medication> findAll();
    public Medication findByMedicationId(Long medicationId);
    public List<Medication> findByAssessment(Assessment assessment);
    public List<Medication> findByPatientIdOrderByMedicationIdDesc(Long patientId);
}
