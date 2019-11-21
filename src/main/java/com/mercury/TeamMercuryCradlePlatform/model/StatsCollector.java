package com.mercury.TeamMercuryCradlePlatform.model;

import com.mercury.TeamMercuryCradlePlatform.Strings;
import com.mercury.TeamMercuryCradlePlatform.repository.AnalysisRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReferralRepository;

import java.time.LocalDate;
import java.util.ArrayList;

public class StatsCollector {
    private static final int MONTHS_IN_YEAR = 12;
    private static final int FIRST_TWO_DIGITS_MONTH = 10;
    private ReadingRepository readingRepository;
    private ReferralRepository referralRepository;
    private AnalysisRepository analysisRepository;
    private String year;

    public StatsCollector(LocalDate localDate, ReadingRepository readingRepository,
                          ReferralRepository referralRepository, AnalysisRepository analysisRepository) {
        this.year = Integer.toString(localDate.getYear());
        this.readingRepository = readingRepository;
        this.referralRepository = referralRepository;
        this.analysisRepository = analysisRepository;
    }

    public ArrayList<ArrayList<Integer>> collectYearlyStats(){
        updateYear(LocalDate.now());

        ArrayList<ArrayList<Integer>> statsCollection = new ArrayList<>();
        ArrayList<Integer> readingList = new ArrayList<>();
        ArrayList<Integer> referralList = new ArrayList<>();
        ArrayList<Integer> complReferralList = new ArrayList<>();
        ArrayList<Integer> pregnantList = new ArrayList<>();
        ArrayList<Integer> pregnantHelpedList = new ArrayList<>();

        ArrayList<Integer> greenReadings = new ArrayList<>();
        ArrayList<Integer> yellowUpReadings = new ArrayList<>();
        ArrayList<Integer> yellowDownReadings = new ArrayList<>();
        ArrayList<Integer> redUpReadings = new ArrayList<>();
        ArrayList<Integer> redDownReadings = new ArrayList<>();

        statsCollection.add(readingList);
        statsCollection.add(referralList);
        statsCollection.add(complReferralList);
        statsCollection.add(pregnantList);
        statsCollection.add(pregnantHelpedList);

        statsCollection.add(greenReadings);
        statsCollection.add(yellowUpReadings);
        statsCollection.add(yellowDownReadings);
        statsCollection.add(redUpReadings);
        statsCollection.add(redDownReadings);

        for (int i = 1; i <= MONTHS_IN_YEAR; i++) {
            String startDateMonth = Integer.toString(i);
            String endDateMonth = Integer.toString(i+1);
            if (i < FIRST_TWO_DIGITS_MONTH)
                startDateMonth = Strings.MONTH_DIGIT_ZERO + startDateMonth;
            if ((i+1) < FIRST_TWO_DIGITS_MONTH)
                endDateMonth = Strings.MONTH_DIGIT_ZERO + endDateMonth;

            String startDate = year + Strings.MONTH_DELIMITER + startDateMonth + Strings.FIRST_DAY_OF_MONTH;
            String endDate = year + Strings.MONTH_DELIMITER + endDateMonth + Strings.FIRST_DAY_OF_MONTH;

            if (i == MONTHS_IN_YEAR) {
                endDate = getNextYear(LocalDate.now()) + Strings.FIRST_OF_JANUARY;
            }

            readingList.add(this.readingRepository.findNumberOfReadingsPerMonth(startDate, endDate));
            referralList.add(this.referralRepository.findNumberOfReferralsPerMonth(startDate, endDate));
            complReferralList.add(this.referralRepository.findNumberOfReferralsPerMonth(startDate, endDate));
            pregnantList.add(this.readingRepository.findNumberOfPregnantWomenPerMonth(startDate, endDate));
            pregnantHelpedList.add(this.referralRepository.findNumberOfReferredPregnantWomenPerMonth(startDate, endDate));

            greenReadings.add(this.analysisRepository.numberOfGreenPerMonth(startDate, endDate));
            yellowUpReadings.add(this.analysisRepository.numberOfYellowUpPerMonth(startDate, endDate));
            yellowDownReadings.add(this.analysisRepository.numberOfYellowDownPerMonth(startDate, endDate));
            redUpReadings.add(this.analysisRepository.numberOfRedUpPerMonth(startDate, endDate));
            redDownReadings.add(this.analysisRepository.numberOfRedDownPerMonth(startDate, endDate));
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
