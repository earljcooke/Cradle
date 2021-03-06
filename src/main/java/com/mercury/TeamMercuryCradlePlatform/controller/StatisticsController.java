package com.mercury.TeamMercuryCradlePlatform.controller;

import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis;
import com.mercury.TeamMercuryCradlePlatform.repository.AnalysisRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.PatientRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.ZonedDateTime;
import java.util.*;


@Controller
@RequestMapping("/statistics")
public class StatisticsController {

    private PatientRepository patientRepository;
    private ReadingRepository readingRepository;
    private AnalysisRepository analysisRepository;

    StatisticsController(PatientRepository patientRepository, ReadingRepository readingRepository,
                         AnalysisRepository analysisRepository){
        this.patientRepository = patientRepository;
        this.readingRepository = readingRepository;
        this.analysisRepository = analysisRepository;
    }


    @RequestMapping(value = "/blood-pressure-graph/{id}", method = RequestMethod.GET)
    public ModelAndView bloodPressureGraph(@PathVariable Long id){
        Patient patient = this.patientRepository.findByPatientId(id);
        List<Reading> readingList = this.readingRepository.findReadingsByPatient(patient);

        List<String> dateArr = new ArrayList<>();
        List<Integer> systolicArr = new ArrayList<>();
        List<Integer> diastolicArr = new ArrayList<>();
        List<Integer> heartRateArr =  new ArrayList<>();

        for (Reading reading : readingList) {

            dateArr.add(reading.getTimeYYYYMMDD());
            systolicArr.add(reading.bpSystolic);
            diastolicArr.add(reading.bpDiastolic);
            heartRateArr.add(reading.heartRateBPM);
        }

        int numbGreen = analysisRepository.countAllByIsGreenEqualsAndPatient(true, patient);
        int numbYellow = analysisRepository.countAllByIsYellowEqualsAndPatient(true, patient);
        int numbRed = analysisRepository.countAllByIsRedEqualsAndPatient(true, patient);

        return new ModelAndView("/statistics/bloodPressureGraph")
                .addObject("dateArr", dateArr)
                .addObject("systolicArr", systolicArr)
                .addObject("diastolicArr", diastolicArr)
                .addObject("heartRateArr", heartRateArr)
                .addObject("data", Arrays.asList(numbGreen, numbYellow, numbRed))
                .addObject("title", getStatsTitle(patient));
    }

    private String getStatsTitle(Patient patient) {
        return " for " + patient.getFirstName() + " " + patient.getLastName();
    }

}
