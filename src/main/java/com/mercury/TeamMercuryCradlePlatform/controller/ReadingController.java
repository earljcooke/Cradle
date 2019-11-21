package com.mercury.TeamMercuryCradlePlatform.controller;

import com.mercury.TeamMercuryCradlePlatform.model.*;

import com.mercury.TeamMercuryCradlePlatform.repository.AnalysisRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.PatientRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;

import com.mercury.TeamMercuryCradlePlatform.repository.SupervisorRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Controller
@RequestMapping("/reading")
public class ReadingController {

    private PatientRepository patientRepository;
    private ReadingRepository readingRepository;
    private AnalysisRepository analysisRepository;
    private SupervisorRepository supervisorRepository;

    ReadingController(PatientRepository patientRepository, ReadingRepository readingRepository,
                      AnalysisRepository analysisRepository, SupervisorRepository supervisorRepository){
        this.patientRepository = patientRepository;
        this.readingRepository = readingRepository;
        this.analysisRepository = analysisRepository;
        this.supervisorRepository = supervisorRepository;
    }

    // Create a new reading
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView readingPage(){
        return new ModelAndView("/reading/create");
    }


    // Produce the analysis after creating a reading
    @RequestMapping(value = "/analysis", method = RequestMethod.POST)
    public @ResponseBody ModelAndView readingAnalysisPage(
            Reading reading,
            @RequestParam(value = "otherSymptoms", defaultValue = "") String otherSymptoms) {

        reading.dateTimeTaken = ZonedDateTime.now();
        reading.setSymptomsList(otherSymptoms);

        ModelAndView modelAndView = new ModelAndView("/reading/analysis");
        modelAndView.addObject("reading", reading);

        return modelAndView;

    }

    // Save the reading to the db
    @RequestMapping(value = "/analysis/save", method = RequestMethod.POST)
    public ModelAndView saveReadingToDB(Reading reading, @RequestParam(value = "dateTimeTaken") String timeTaken,
                                        @RequestParam(value = "gestationalAgeUnit") String value,
                                        @RequestParam(value = "saveByReferral") String saveByRef) {

        // Need to manually set these fields again otherwise it saves it as null in db
        reading.gestationalAgeUnit = GestationalAgeUnit.valueOf(value);
        reading.dateTimeTaken = ZonedDateTime.parse(timeTaken);
        reading.dateUploadedToServer = ZonedDateTime.now();

        // If a patient exists with the same first, last and age then link this reading to the existing patient, else create new patient
        Patient patient = patientRepository.findByFirstNameAndLastNameAndAgeYears(reading.firstName, reading.lastName, reading.ageYears);

        if (patient == null) {
            patient = new Patient(reading);
            patientRepository.save(patient);
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            String username = userDetails.getUsername();
            SupervisorPatientPair supervisorPatientPair = new SupervisorPatientPair(username, patient.getPatientId().toString());
            supervisorRepository.save(supervisorPatientPair);
        }

        reading.setPatient(patient);
        Analysis analysis = new Analysis(reading);

        readingRepository.save(reading);
        analysisRepository.save(analysis);

        if(saveByRef.equalsIgnoreCase("true")){
            return new ModelAndView("/referral/addReferral");
        }
        return setUpAllReadingModel();
    }

    // Update a reading
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public ModelAndView updateReadingInDB(@PathVariable(value = "id") long id, Reading reading,
                                          @RequestParam(value = "otherSymptoms", defaultValue = "")  String otherSymptoms) {

        System.out.println("update");
        Reading dbReading = readingRepository.findByReadingId(id);
        Analysis dbAnalysis = analysisRepository.findByReading(dbReading);

        reading.readingId = id;
        reading.setSymptomsList(otherSymptoms);
        reading.dateTimeTaken = dbReading.dateTimeTaken;
        reading.dateUploadedToServer = dbReading.dateUploadedToServer;

        Patient patient = patientRepository.findByFirstNameAndLastNameAndAgeYears(reading.firstName, reading.lastName, reading.ageYears);

        if (patient != null) {
            reading.setPatient(patient);
        }


        Analysis analysis = new Analysis(reading);
        analysis.analysisId = dbAnalysis.getAnalysisId();
        this.analysisRepository.save(analysis);
        this.readingRepository.save(reading);
        return setUpAllReadingModel();
    }


//     View all readings
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public ModelAndView getAllReadings(){
        return setUpAllReadingModel();
    }

    @RequestMapping(value = "/all/{id}", method = RequestMethod.GET)
    public ModelAndView getReadingsWithPatientId(@PathVariable Long id){
        List<Reading> readings = this.readingRepository.findReadingsByPatient(patientRepository.findByPatientId(id));
        System.out.println(readings.size());
        for(Reading r : readings){
            r.symptoms = new ArrayList<>(Arrays.asList(r.symptomsString.split(",")));
        }
        return new ModelAndView("/reading/all").addObject("readingList", readings);
    }


    // Save a reading after editing from the view all readings table
//    @RequestMapping(value = "/all/edit", method = RequestMethod.POST)
//    public ModelAndView getAllReadings(Reading reading){
//        this.readingRepository.save(reading);
//        return setUpAllReadingModel();
//    }

    // Edit a reading with the given id
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView getReadingWithId(@PathVariable long id){
        return new ModelAndView("/reading/editReading").addObject("reading", this.readingRepository.findByReadingId(id));
    }

    // Delete a reading with the given id
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public ModelAndView deleteReadingWithId(@PathVariable long id){
        Reading deletedReading = this.readingRepository.findByReadingId(id);
        this.analysisRepository.delete(this.analysisRepository.findByReading(deletedReading));
        this.readingRepository.delete(deletedReading);
        return setUpAllReadingModel();
    }

    // Create a model for view all readings and pass in a List of reading objects
    private ModelAndView setUpAllReadingModel(){

        List<Reading> readings = this.readingRepository.findAll();
        for(Reading r : readings){
            r.symptoms = new ArrayList<>(Arrays.asList(r.symptomsString.split(",")));
        }
        return new ModelAndView("/reading/all").addObject("readingList", readings);
    }

}
