package com.mercury.TeamMercuryCradlePlatform.repository;

import com.mercury.TeamMercuryCradlePlatform.model.SupervisorPatientPair;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Transactional
@Repository
public interface SupervisorRepository extends CrudRepository<SupervisorPatientPair, Integer> {
    public SupervisorPatientPair findByPairId(Integer pairId);
    public ArrayList<SupervisorPatientPair> findAll();

    @Modifying
    @Query("UPDATE SupervisorPatientPair sp SET sp.supervisorId = ?2 WHERE sp.supervisorId = ?1")
    public void updateVHT(String oldVHTId, String newVHTId);
}
