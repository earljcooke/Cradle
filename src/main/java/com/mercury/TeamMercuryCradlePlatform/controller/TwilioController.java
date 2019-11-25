package com.mercury.TeamMercuryCradlePlatform.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mercury.TeamMercuryCradlePlatform.Service.ContactService;
import com.mercury.TeamMercuryCradlePlatform.model.AndroidReading;
import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.repository.PatientRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.io.IOException;
import java.util.List;

@Controller
public class TwilioController {
    @Autowired
    private ReadingRepository readingRepository;
    @Autowired
    private PatientRepository patientRepository;

    @RequestMapping(value="/receive/sms", method=RequestMethod.POST)
    public void receiveSms(@RequestParam("Body") String body, @RequestParam("From") String From) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        List<AndroidReading> readingList = mapper.readValue(body, new TypeReference<List<AndroidReading>>(){});

        for (AndroidReading androidReading : readingList) {
            createReadingFromAndroid(androidReading, patientRepository, readingRepository);
        }

        sendConfirmationSms(From);
    }

    private void sendConfirmationSms(String phoneNumber) {
        ContactService contactService = new ContactService();
        String message = "Readings have been successfully uploaded!";

        contactService.sendMessage("SMS", null, phoneNumber, "", message);
    }

    static void createReadingFromAndroid(AndroidReading androidReading, PatientRepository patientRepository, ReadingRepository readingRepository) {
        Reading reading = new Reading(androidReading);
        Patient patient = patientRepository.findByFirstNameAndLastNameAndAgeYears(androidReading.getPatientFirstName(), androidReading.getPatientLastName(), androidReading.getAgeYears());

        if(patient != null) {
            reading.setPatient(patient);
            readingRepository.save(reading);
        } else {
            reading.setPatient(new Patient(reading));
            readingRepository.save(reading);
        }
    }
}