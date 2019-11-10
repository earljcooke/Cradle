package com.mercury.TeamMercuryCradlePlatform.repository;

import com.mercury.TeamMercuryCradlePlatform.model.Referral;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface ReferralRepository extends CrudRepository<Referral, Long> {
    public List<Referral> findAll();
    public Referral findByReferralId(Long id);

    @Query( value = "SELECT COUNT(*) FROM referral WHERE date_time_sent >= ?1 AND date_time_sent < ?2", nativeQuery = true)
    public Integer findNumberOfReferralsPerMonth(String monthFirstDay, String nextMonthFirstDay);
}
