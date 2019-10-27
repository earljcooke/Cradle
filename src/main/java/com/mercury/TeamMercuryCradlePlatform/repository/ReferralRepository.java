package com.mercury.TeamMercuryCradlePlatform.repository;

import com.mercury.TeamMercuryCradlePlatform.model.Referral;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface ReferralRepository extends CrudRepository<Referral, Long> {
    public List<Referral> findAll();
    public Referral findByReferralId(Long id);
}
