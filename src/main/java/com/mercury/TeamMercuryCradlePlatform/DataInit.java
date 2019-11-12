package com.mercury.TeamMercuryCradlePlatform;

import com.mercury.TeamMercuryCradlePlatform.model.GestationalAgeUnit;
import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.model.User;
import com.mercury.TeamMercuryCradlePlatform.repository.*;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;

import org.threeten.bp.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Service
public class DataInit implements CommandLineRunner {
    private UserRepository userRepository;
    private PatientRepository patientRepository;
    private ReadingRepository readingRepository;
    private SupervisorRepository supervisorRepository;
    private ReferralRepository referralRepository;

    public DataInit(UserRepository userRepository, PatientRepository patientRepository,
                    ReadingRepository readingRepository, SupervisorRepository supervisorRepository, ReferralRepository referralRepository) {
        this.userRepository = userRepository;
        this.patientRepository = patientRepository;
        this.readingRepository = readingRepository;
        this.supervisorRepository = supervisorRepository;
        this.referralRepository = referralRepository;
    }

    @Override
    public void run(String... args) {
        User admin = new User("justTesting", "John", "Lee", "test@test.com", "ADMIN", "1234567890");
        User vht = new User("1234", "Yoon", "Lee", "test2@test.com","VHT,ADMIN,HEALTHWORKER", "9999999999");
        User healthWorker = new User("1234", "Megan","Fox", "test3@test.com", "ADMIN,HEALTHWORKER", "0001111111");

        List<User> users = Arrays.asList(admin, vht, healthWorker);
        userRepository.saveAll(users);

        Patient patient1 = new Patient("48300027402","Ricky", "Owen","Uganda", "VillageA");
        patient1.setAgeYears(29);
        Patient patient2 = new Patient("00159694421","Bobby", "Frown", "Uganda", "VillageA");
        patient2.setAgeYears(80);
        Patient patient3 = new Patient("392310","Braum", "Gloss", "Uganda", "VillageB");
        patient3.setAgeYears(13);
        Patient patient4 = new Patient("323494760911189","Bro", "Ther", "Uganda", "VillageB");

        Reading reading = new Reading("Ricky", "Owen", 29,
                Arrays.asList(Strings.SYMPTOM_HEADACHE, Strings.SYMPTOM_BLURRED_VISION, "dead"),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "1",
                130, 100, 90,
                ZonedDateTime.of(LocalDateTime.of(2019, 4, 5, 9, 30),  ZoneId.systemDefault()));
        reading.dateUploadedToServer = reading.dateTimeTaken;

        Reading reading2 = new Reading("Ricky", "Owen", 29,
                Collections.singletonList(Strings.SYMPTOM_NO_SYMPTOMS),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_WEEKS, "7",
                90, 60, 60,
                ZonedDateTime.of(LocalDateTime.of( 2019,6,1,3,15), ZoneId.systemDefault()));
        reading2.dateUploadedToServer = reading2.dateTimeTaken;

        Reading reading3 = new Reading("Ricky", "Owen", 29,
                Arrays.asList(Strings.SYMPTOM_HEADACHE, Strings.SYMPTOM_BLURRED_VISION, "not dead"),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_NONE, "1",
                80, 70, 120,
                ZonedDateTime.now());
        reading3.dateUploadedToServer = reading3.dateTimeTaken;

        Reading reading4 = new Reading("Ricky", "Owen", 29,
                Arrays.asList(Strings.SYMPTOM_HEADACHE, Strings.SYMPTOM_BLURRED_VISION),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_NONE, "1",
                200, 150, 180,
                ZonedDateTime.of(LocalDateTime.of( 2019,7,5,19,30), ZoneId.systemDefault()));
        reading4.dateUploadedToServer = reading4.dateTimeTaken;

        Reading reading5 = new Reading("Bobby", "Frown", 80,
                Arrays.asList(Strings.SYMPTOM_HEADACHE, Strings.SYMPTOM_BLURRED_VISION, Strings.SYMPTOM_BLEEDING),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_NONE, "0",
                150, 100, 180,
                ZonedDateTime.of(LocalDateTime.of( 2019,1,4, 1,15), ZoneId.systemDefault()));
        reading5.dateUploadedToServer = reading5.dateTimeTaken;

        List<Reading> patient1Readings = Arrays.asList(reading, reading2, reading3, reading4);
        List<Reading> patient2Readings = Collections.singletonList(reading5);

        patient1.addAllReadings(patient1Readings);
        patient1Readings.forEach(r -> r.setPatient(patient1));

        patient2.addAllReadings(patient2Readings);
        patient2Readings.forEach(r -> r.setPatient(patient2));

        patientRepository.saveAll(Arrays.asList(patient1, patient2, patient3));
        readingRepository.saveAll(patient1Readings);
        readingRepository.saveAll(patient2Readings);

    }
}
