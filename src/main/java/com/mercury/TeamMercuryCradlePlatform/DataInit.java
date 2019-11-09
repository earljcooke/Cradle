package com.mercury.TeamMercuryCradlePlatform;

import com.mercury.TeamMercuryCradlePlatform.model.GestationalAgeUnit;
import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.model.User;
import com.mercury.TeamMercuryCradlePlatform.repository.*;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import org.threeten.bp.ZonedDateTime;
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
                ZonedDateTime.now());

        Reading reading2 = new Reading("Ricky", "Owen", 29,
                Collections.singletonList(Strings.SYMPTOM_NO_SYMPTOMS),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_WEEKS, "7",
                90, 60, 60,
                ZonedDateTime.now());

        Reading reading3 = new Reading("Ricky", "Owen", 29,
                Arrays.asList(Strings.SYMPTOM_HEADACHE, Strings.SYMPTOM_BLURRED_VISION, "not dead"),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_NONE, "1",
                80, 70, 120,
                ZonedDateTime.now());

        Reading reading4 = new Reading("Ricky", "Owen", 29,
                Arrays.asList(Strings.SYMPTOM_HEADACHE, Strings.SYMPTOM_BLURRED_VISION),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_NONE, "1",
                200, 150, 180,
                ZonedDateTime.now());

        List<Reading> readings = Arrays.asList(reading, reading2, reading3, reading4);

        patient1.addAllReadings(readings);
        readings.forEach(r -> r.setPatient(patient1));

        patientRepository.saveAll(Arrays.asList(patient1, patient2, patient3));
        readingRepository.saveAll(readings);

    }
}
