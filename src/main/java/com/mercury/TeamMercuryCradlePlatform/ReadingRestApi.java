package com.mercury.TeamMercuryCradlePlatform;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.PatientRepository;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/*
    General requirements
        • All commands return HTTP 200 (OK) unless otherwise stated.
        • Any end-point accepting an ID must return an HTTP 404 error with a meaningful
        message if the ID does not exist.

    The REST API for your application should have the following endpoints:

    GET /api/tokimon/all
        • Returns a list of all Tokimon objects in the tokimon.json file. This includes all attributes
        associated with each object.

    GET /api/tokimon/{id}
        • Returns an object corresponding to Tokimon with the specified id. For example
        /api/tokimon/3 would return the Tokimon object corresponding to id=3.

    POST /api/tokimon/add
        • Create a new Tokimon.
        • Returns HTTP 201: Created.
        • Expected body contents include all attributes of the new Tokimon.

    DELETE /api/tokimon/{id}
        • Removes Tokimon with specified id.
        • Returns HTTP 204: No content.
 */

/**
 * <h1>TokimonRestApi</h1>
 * This class is responsible for handling all of the server calls
 *
 *
 * @author  Mashuque Hasan
 * @version 1.0
 * @since   2019-04-08
 */



@RestController
public class ReadingRestApi {

    private ReadingRepository readingRepository;
    private PatientRepository patientRepository;


    public ReadingRestApi(ReadingRepository readingRepository, PatientRepository patientRepository) {
        this.readingRepository = readingRepository;
        this.patientRepository = patientRepository;

    }

    @GetMapping("/api/reading/all")
    @ResponseStatus (HttpStatus.OK)
    public List<Reading> getAllReadings(){

        List<Reading> readingList = readingRepository.findAll();

        for(Reading r : readingList){
            r.convertZonedDateTimeToString();
            r.symptoms = new ArrayList<>(Arrays.asList(r.symptomsString.split(",")));
        }

        return readingList;
//        ObjectMapper mapper = new ObjectMapper();
//        mapper.registerModule(new JavaTimeModule());
//        try {
//            return mapper.writeValueAsString(readingRepository.findAll());
//        } catch (JsonProcessingException e) {
//            e.printStackTrace();
//        }
//        return null;
    }

    @GetMapping("api/patient/all")
    @ResponseStatus (HttpStatus.OK)
    public List<Patient> getAllPatients(){
        List<Patient> patients = patientRepository.findAll();
        System.out.println(patients.size());
        return patients;
    }

    @PostMapping("api/post/reading")
    @ResponseStatus(HttpStatus.OK)
    public Reading addReading(@RequestBody Reading reading){

        if(reading == null){
            throw new IllegalArgumentException();
        }

        reading.convertStringToDateZonedTime();
        reading.setSymptoms(reading.symptoms);

        Patient patient = patientRepository.findByFirstNameAndLastNameAndAgeYears(reading.firstName, reading.lastName, reading.ageYears);

        if (patient != null) {
            reading.setPatient(patient);
            readingRepository.save(reading);
        }

        this.readingRepository.save(reading);

        System.out.println("Reading: "  + reading.toString());

        return reading;

    }

    @ResponseStatus(value = HttpStatus.NOT_FOUND,reason = "ID not found")
    @ExceptionHandler(IllegalArgumentException.class)
    public void illegalExceptionHandler(){}

}
