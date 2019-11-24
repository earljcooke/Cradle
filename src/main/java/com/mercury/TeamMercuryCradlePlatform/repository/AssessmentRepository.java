package com.mercury.TeamMercuryCradlePlatform.repository;

import com.mercury.TeamMercuryCradlePlatform.model.Assessment;
import com.mercury.TeamMercuryCradlePlatform.model.Referral;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AssessmentRepository extends CrudRepository<Assessment, Long> {
    public List<Assessment> findAll();
    public Assessment findByAssessmentId(Long assessmentId);
    public Assessment findByReferral(Referral referral);
}
