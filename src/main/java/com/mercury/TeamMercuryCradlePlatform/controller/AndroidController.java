package com.mercury.TeamMercuryCradlePlatform.controller;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import com.google.gson.Gson;
import com.mercury.TeamMercuryCradlePlatform.model.AndroidReading;
import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.repository.PatientRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.UserRepository;

import net.lingala.zip4j.ZipFile;
import net.lingala.zip4j.exception.ZipException;

import net.lingala.zip4j.model.FileHeader;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.apache.tomcat.util.http.fileupload.IOUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.*;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;
import java.util.zip.ZipEntry;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/android")
public class AndroidController {
    @Autowired
    private PatientRepository patientRepository;
    @Autowired
    private ReadingRepository readingRepository;
    @Autowired
    private UserRepository userRepository;

    public AndroidController(PatientRepository patientRepository, ReadingRepository readingRepository) {
        this.patientRepository = patientRepository;
        this.readingRepository = readingRepository;
    }

    @RequestMapping(value = "/patients", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String getAllPatients() throws JsonProcessingException {
        List<Patient> patients = patientRepository.findAll();

        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(patients);
        }
        catch (JsonGenerationException e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value = "reading/findByPatientID/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String getReadingsByPatientId(@PathVariable Long id) {
        Patient patient = patientRepository.findByPatientId(id);
        List<Reading> readings = readingRepository.findReadingsByPatient(patient);

        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());
        try {
            return mapper.writeValueAsString(readings);
        }
        catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Object> uploadFile(@RequestParam("file") MultipartFile file) throws IOException {
        File convertFile = new File("C:\\Users\\John\\Desktop\\test\\"  + file.getOriginalFilename());
        boolean res = convertFile.createNewFile();
        FileOutputStream fout = new FileOutputStream(convertFile);
        fout.write(file.getBytes());
        fout.close();

        String destination = "C:\\Users\\John\\Desktop\\test";
        try {
            ZipFile zipFile = new ZipFile(convertFile);
            zipFile.extractAll(destination);

            File dataFile = new File(destination + "\\unencrypted\\data.zip");
            ZipFile dataZipFile = new ZipFile(dataFile);
            dataZipFile.extractAll(destination);
            File dir = new File(destination);
            for(File f: dir.listFiles()) {
                if (f.getName().endsWith((".json"))) {
                    storeJson(f);
                }
            }
        } catch (ZipException e) {
            e.printStackTrace();
        } finally {
            //convertFile.delete();
            FileUtils.cleanDirectory(new File(destination));
        }
        return new ResponseEntity<>("File uploaded successfully", HttpStatus.OK);
    }

    private void storeJson(File file) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        AndroidReading androidReading = mapper.readValue(file, AndroidReading.class);

        Reading reading = new Reading(androidReading);
        Patient patient = patientRepository.findByFirstNameAndLastNameAndAgeYears(reading.firstName, reading.lastName, reading.ageYears);

        if(patient != null) {
            reading.setPatient(patient);
            readingRepository.save(reading);
        } else {
            reading.setPatient(new Patient(reading));
            readingRepository.save(reading);
        }
    }
}

