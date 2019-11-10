package com.mercury.TeamMercuryCradlePlatform.repository;

import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReadingRepository extends CrudRepository<Reading, Long> {
    List<Reading> findReadingsByPatient(Patient patient);
    public Reading findByReadingId(Long id);
    public List<Reading> findAll();

    public Reading findReadingByFirstNameAndLastNameAndAgeYearsAndBpSystolicAndBpDiastolicAndHeartRateBPM(String firstName,
                                                                                                          String lastName, Integer ageYears,
                                                                                                          Integer bpSystolic, Integer bpDiastolic,
                                                                                                          Integer heartRateBPM);

    @Query( value = "SELECT COUNT(*) FROM reading WHERE data_time_taken >= ?1 AND data_time_taken < ?2", nativeQuery = true)
    public Integer findNumberOfReadingsPerMonth(String monthFirstDay, String nextMonthFirstDay);

    @Query( value = "SELECT COUNT(*) FROM reading WHERE data_time_taken >= ?1 AND data_time_taken < ?2  AND gestational_age_unit <> 0",
            nativeQuery = true)
    public Integer findNumberOfPregnantWomenPerMonth(String monthFirstDay, String nextMonthFirstDay);

    @Query( value = "SELECT COUNT(*) FROM reading r INNER JOIN referral ref ON r.reading_id = ref.reading_id" +
            " WHERE r.data_time_taken >=?1 AND r.data_time_taken < ?2 AND r.gestational_age_unit <> 0",
            nativeQuery = true)
    public Integer findNumberOfReferredPregnantWomenPerMonth(String monthFirstDay, String nextMonthFirstDay);

}
