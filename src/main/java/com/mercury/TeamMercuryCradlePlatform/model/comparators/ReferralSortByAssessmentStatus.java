package com.mercury.TeamMercuryCradlePlatform.model.comparators;

import com.mercury.TeamMercuryCradlePlatform.model.Referral;

import java.util.Comparator;

public class ReferralSortByAssessmentStatus implements Comparator<Referral> {
    @Override
    public int compare(Referral referral1, Referral referral2) {
        if (referral1.getIsAssessed() == referral2.getIsAssessed()){
            return (int) (referral1.getReferralId() - referral2.getReferralId());
        } else if (referral1.getIsAssessed()){
            return 1;
        }
        return -1;
    }
}
