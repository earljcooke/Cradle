package com.mercury.TeamMercuryCradlePlatform.model;

import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReferralRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.SupervisorRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.UserRepository;

import java.time.LocalDate;
import java.util.ArrayList;

public class StatsCollector {
    private static final int NUMBOFMONTHS = 12;
    private static final int ONENUMBERMONTH = 10;
    private UserRepository userRepository;
    private SupervisorRepository supervisorRepository;
    private ReadingRepository readingRepository;
    private ReferralRepository referralRepository;
    private String year;

    public StatsCollector(LocalDate localDate, UserRepository userRepository, SupervisorRepository supervisorRepository,
                          ReadingRepository readingRepository, ReferralRepository referralRepository) {
        this.year = Integer.toString(localDate.getYear());
        this.userRepository = userRepository;
        this.supervisorRepository = supervisorRepository;
        this.readingRepository = readingRepository;
        this.referralRepository = referralRepository;
    }

    public ArrayList<ArrayList<Integer>> collectYearlyStats(){
        updateYear(LocalDate.now());

        ArrayList<ArrayList<Integer>> statsCollection = new ArrayList<>();
        ArrayList<Integer> readingList = new ArrayList<>();
        ArrayList<Integer> referralList = new ArrayList<>();
        ArrayList<Integer> complReferralList = new ArrayList<>();
        ArrayList<Integer> pregnantList = new ArrayList<>();
        ArrayList<Integer> pregnantHelpedList = new ArrayList<>();

        statsCollection.add(readingList);
        statsCollection.add(referralList);
        statsCollection.add(complReferralList);
        statsCollection.add(pregnantList);
        statsCollection.add(pregnantHelpedList);

        for (int i = 1; i <= NUMBOFMONTHS; i++) {
            String startDateMonth = Integer.toString(i);
            String endDateMonth = Integer.toString(i+1);
            if (i < ONENUMBERMONTH)
                startDateMonth = "0" + startDateMonth;
            if ((i+1) < ONENUMBERMONTH)
                endDateMonth = "0" + endDateMonth;

            String startDate = year + "-" + startDateMonth + "-01";
            String endDate = year + "-" + endDateMonth + "-01";

            if (i == NUMBOFMONTHS) {
                endDate = getNextYear(LocalDate.now()) + "-01-01";
            }

            readingList.add(this.readingRepository.findNumberOfReadingsPerMonth(startDate, endDate));
            referralList.add(this.referralRepository.findNumberOfReferralsPerMonth(startDate, endDate));
            complReferralList.add(this.referralRepository.findNumberOfReferralsPerMonth(startDate, endDate));
            pregnantList.add(this.readingRepository.findNumberOfPregnantWomenPerMonth(startDate, endDate));
            pregnantHelpedList.add(this.readingRepository.findNumberOfReferredPregnantWomenPerMonth(startDate, endDate));
        }

        return statsCollection;
    }

    public String getYear() {
        return year;
    }

    private void updateYear(LocalDate localDate) {
        this.year = Integer.toString(localDate.getYear());
    }

    private String getNextYear(LocalDate nextYear) {
        return Integer.toString(nextYear.plusYears(1).getYear());
    }
}
