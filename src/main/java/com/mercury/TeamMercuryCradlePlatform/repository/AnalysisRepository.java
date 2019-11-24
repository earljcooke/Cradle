package com.mercury.TeamMercuryCradlePlatform.repository;

import com.mercury.TeamMercuryCradlePlatform.model.Analysis;
import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AnalysisRepository extends CrudRepository<Analysis, Long> {
    public List<Analysis> findAll();
    public Analysis findByAnalysisId(Long id);
    public Analysis findByReading(Reading reading);
    public Analysis getOneByReading(Reading reading);



    // For Patient stats
    public Integer countAllByIsGreenEqualsAndPatient(Boolean isGreen, Patient patient);
    public Integer countAllByIsYellowEqualsAndPatient(Boolean isGreen, Patient patient);
    public Integer countAllByIsRedEqualsAndPatient(Boolean isGreen, Patient patient);

    // For Total stats
    @Query( value = "SELECT COUNT(*) FROM analysis WHERE is_green = true AND date_time_created >= ?1 AND date_time_created < ?2",
            nativeQuery = true)
    public Integer numberOfGreenPerMonth(String monthFirstDay, String nextMonthFirstDay);
    @Query( value = "SELECT COUNT(*) FROM analysis WHERE is_yellow = true " +
            "AND arrow_up = true AND date_time_created >= ?1 AND date_time_created < ?2",
            nativeQuery = true)
    public Integer numberOfYellowUpPerMonth(String monthFirstDay, String nextMonthFirstDay);
    @Query( value = "SELECT COUNT(*) FROM analysis WHERE is_yellow = true" +
            " AND arrow_down = true AND date_time_created >= ?1 AND date_time_created < ?2",
            nativeQuery = true)
    public Integer numberOfYellowDownPerMonth(String monthFirstDay, String nextMonthFirstDay);
    @Query( value = "SELECT COUNT(*) FROM analysis WHERE is_red = true" +
            " AND arrow_up = true AND date_time_created >= ?1 AND date_time_created < ?2",
            nativeQuery = true)
    public Integer numberOfRedUpPerMonth(String monthFirstDay, String nextMonthFirstDay);
    @Query( value = "SELECT COUNT(*) FROM analysis WHERE is_red = true" +
            " AND arrow_down = true AND date_time_created >= ?1 AND date_time_created < ?2",
            nativeQuery = true)
    public Integer numberOfRedDownPerMonth(String monthFirstDay, String nextMonthFirstDay);
}
