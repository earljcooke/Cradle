package com.mercury.TeamMercuryCradlePlatform.repository;

import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReadingRepository extends CrudRepository<Reading, Long> {
    List<Reading> findReadingsByPatient(Patient patient);
    public Reading findByReadingId(Long id);
    public List<Reading> findAll();

    public Reading findReadingByFirstNameAndLastNameAndAgeYearsAndBpSystolicAndBpDiastolicAndHeartRateBPM(String firstName, String lastName, Integer ageYears, Integer bpSystolic, Integer bpDiastolic, Integer heartRateBPM);

}
