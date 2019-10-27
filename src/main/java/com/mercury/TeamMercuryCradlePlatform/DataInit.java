package com.mercury.TeamMercuryCradlePlatform;

import com.mercury.TeamMercuryCradlePlatform.model.GestationalAgeUnit;
import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.model.User;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.PatientRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.SupervisorRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.UserRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class DataInit implements CommandLineRunner {
    private UserRepository userRepository;
    private PatientRepository patientRepository;
    private ReadingRepository readingRepository;
    private SupervisorRepository supervisorRepository;

    public DataInit(UserRepository userRepository,
                    PatientRepository patientRepository, ReadingRepository readingRepository, SupervisorRepository supervisorRepository) {
        this.userRepository = userRepository;
        this.patientRepository = patientRepository;
        this.readingRepository = readingRepository;
        this.supervisorRepository = supervisorRepository;
    }

    @Override
    public void run(String... args) {
        User admin = new User("1234", "John", "Lee", "test@test.com", "ADMIN", "1234567890");
        User vht = new User("1234", "Yoon", "Lee", "test2@test.com","VHT,ADMIN,HEALTHWORKER", "9999999999");
        User healthWorker = new User("1234", "Megan","Fox", "test3@test.com", "ADMIN,HEALTHWORKER", "0001111111");

        List<User> users = Arrays.asList(admin, vht, healthWorker);
        userRepository.saveAll(users);

        Patient patient1 = new Patient("48300027402","Ricky", "Owen","Uganda", "VillageA");
        Patient patient2 = new Patient("00159694421","Bobby", "Frown", "Uganda", "VillageA");
        Patient patient3 = new Patient("392310","Braum", "Gloss", "Uganda", "VillageB");
        Patient patient4 = new Patient("323494760911189","Bro", "Ther", "Uganda", "VillageB");

        List<String> symptoms = new ArrayList<>();
        symptoms.add("Headache");
        symptoms.add("Blurred vision");
        symptoms.add("test");
        symptoms.add("test2");

        Reading reading = new Reading("Ricky", "Owen", 29, symptoms, GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "1", 90, 60, 60, ZonedDateTime.now());

        symptoms = new ArrayList<>();
        symptoms.add(Strings.SYMPTOM_NO_SYMPTOMS);
        Reading reading2 = new Reading("Ricky", "Owen", 29, symptoms, GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "1", 90, 60, 60, ZonedDateTime.now());

        patientRepository.saveAll(Arrays.asList(patient1, patient2, patient3, patient4));
        readingRepository.saveAll(Arrays.asList(reading, reading2));

    }
}
