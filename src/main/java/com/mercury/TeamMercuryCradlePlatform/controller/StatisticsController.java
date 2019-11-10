package com.mercury.TeamMercuryCradlePlatform.controller;

import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis;
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

    StatisticsController(PatientRepository patientRepository, ReadingRepository readingRepository){
        this.patientRepository = patientRepository;
        this.readingRepository = readingRepository;
    }


    @RequestMapping(value = "/blood-pressure-graph/{id}", method = RequestMethod.GET)
    public ModelAndView bloodPressureGraph(@PathVariable Long id){

        System.out.println(id);

        ModelAndView modelAndView = new ModelAndView("/statistics/bloodPressureGraph");

        int numbGreen = 0, numbYellow = 0, numbRed = 0;
        List<Reading> readingList = this.readingRepository.findReadingsByPatient(this.patientRepository.findByPatientId(id));

        List<String> dateArr = new ArrayList<>();
        List<Integer> systolicArr = new ArrayList<>();
        List<Integer> diastolicArr = new ArrayList<>();
        List<Integer> heartRateArr =  new ArrayList<>();

        for (Reading reading : readingList) {

            dateArr.add(reading.getTimeYYYYMMDD());
            systolicArr.add(reading.bpSystolic);
            diastolicArr.add(reading.bpDiastolic);
            heartRateArr.add(reading.heartRateBPM);

            ReadingAnalysis analysis = ReadingAnalysis.analyze(reading);
            if (analysis.isGreen()) {
                numbGreen++;
            } else if (analysis.isYellow()) {
                numbYellow++;
            } else {
                numbRed++;
            }
        }

        modelAndView.addObject("dateArr", dateArr);
        modelAndView.addObject("systolicArr", systolicArr);
        modelAndView.addObject("diastolicArr", diastolicArr);
        modelAndView.addObject("heartRateArr", heartRateArr);
        modelAndView.addObject("data", Arrays.asList(numbGreen, numbYellow, numbRed));

        return modelAndView;
    }

}
