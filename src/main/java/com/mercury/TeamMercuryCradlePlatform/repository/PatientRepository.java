package com.mercury.TeamMercuryCradlePlatform.repository;

import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PatientRepository extends CrudRepository<Patient, Long> {
    public List<Patient> findAll();

    Patient findByPatientId(Long id);

    @Query("SELECT c FROM Patient c WHERE c.attestationID LIKE ?1")
    Optional<Patient> findByAttestationID(@Param("id") String id);

    @Query("SELECT c FROM Patient c WHERE c.firstName LIKE %?1%")
    List<Patient> findAllByFirstNameLike(String firstName);
    Patient findByFirstNameAndLastNameAndAgeYears(String firstName, String lastName, Integer ageYears);

    Boolean existsByFirstNameAndLastNameAndAgeYears(String firstName, String lastName, Integer ageYears);


    @Query("SELECT c FROM Patient c WHERE c.lastName LIKE %?1%")
    List<Patient> findAllByLastNameLike(String lastName);

}
