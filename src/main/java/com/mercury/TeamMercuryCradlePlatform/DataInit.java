package com.mercury.TeamMercuryCradlePlatform;

import com.mercury.TeamMercuryCradlePlatform.model.*;
import com.mercury.TeamMercuryCradlePlatform.repository.*;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.time.*;
import java.time.LocalDate;
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
    private AnalysisRepository analysisRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public DataInit(UserRepository userRepository, PatientRepository patientRepository,
                    ReadingRepository readingRepository, SupervisorRepository supervisorRepository,
                    ReferralRepository referralRepository, AnalysisRepository analysisRepository) {
        this.userRepository = userRepository;
        this.patientRepository = patientRepository;
        this.readingRepository = readingRepository;
        this.supervisorRepository = supervisorRepository;
        this.referralRepository = referralRepository;
        this.analysisRepository = analysisRepository;
        this.bCryptPasswordEncoder = new BCryptPasswordEncoder();
    }

    @Override
    public void run(String... args) {
        User admin = new User(bCryptPasswordEncoder.encode("1234"), "John", "Lee", "test@test.com", "ADMIN", "1234567890");
        User vht = new User(bCryptPasswordEncoder.encode("1234"), "Yoon", "Lee", "test2@test.com","VHT,ADMIN,HEALTHWORKER", "9999999999");
        User healthWorker = new User(bCryptPasswordEncoder.encode("1234"), "Megan","Fox", "test3@test.com", "ADMIN,HEALTHWORKER", "0001111111");

        List<User> users = Arrays.asList(admin, vht, healthWorker);
        userRepository.saveAll(users);

        Patient patient1 = new Patient("48300027403","Abbor", "Kakooza","Uganda", "Lira", 29);
        Patient patient2 = new Patient("00159694421","Achen", "Kakooza", "Uganda", "Lira", 36);
        Patient patient3 = new Patient("39231011111","Dembe", "Kitumba", "Uganda", "Kiboga", 19);
        Patient patient4 = new Patient("32349476091","Namono", "Mbira", "Uganda", "Kiboga", 80);
        Patient patient5 = new Patient("19574822094","Emmanuel", "Otala", "Uganda", "Kampala", 9);
        Patient patient6 = new Patient("33269873302","Natukunda", "Mbira", "Uganda", "Kampala", 22);
        Patient patient7 = new Patient("80998173275","Dembe", "Onek", "Uganda", "Kampala", 15);
        Patient patient8 = new Patient("12552771169","Kizza", "Alupo", "Uganda", "Rakai", 76);
        Patient patient9 = new Patient("56782458742","Jennifer", "Eriyo", "Uganda", "Tororo", 56);
        Patient patient10 = new Patient("10090277812","Jeje", "Kony", "Uganda", "Sironko", 26);
        Patient patient11 = new Patient("63694282111","Kahinda", "Otafiire", "Uganda", "Lira", 26);

        List<Patient> patients = Arrays.asList(patient1, patient2, patient3, patient4, patient5, patient6, patient7,
                patient8, patient9, patient10, patient11);

        Reading reading1 = new Reading("Abbo", "Kakooza", 29,
                Arrays.asList(Strings.SYMPTOM_HEADACHE, Strings.SYMPTOM_BLURRED_VISION, "Shaking"),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "1",
                130, 100, 90,
                ZonedDateTime.of(LocalDate.of( 2019,4,5), LocalTime.of(9,30), ZoneId.systemDefault()));

        Reading reading2 = new Reading("Abbo", "Kakooza", 29,
                Collections.singletonList(Strings.SYMPTOM_NO_SYMPTOMS),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "2",
                90, 60, 60,
                ZonedDateTime.of(LocalDate.of( 2019,5,30), LocalTime.of(20,45), ZoneId.systemDefault()));

        Reading reading3 = new Reading("Abbo", "Kakooza", 29,
                Arrays.asList(Strings.SYMPTOM_HEADACHE),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "3",
                80, 70, 120,
                ZonedDateTime.of(LocalDate.of( 2019,6,1), LocalTime.of(3,15), ZoneId.systemDefault()));

        Reading reading4 = new Reading("Abbo", "Kakooza", 29,
                Arrays.asList(Strings.SYMPTOM_HEADACHE),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "4",
                118, 75, 100,
                ZonedDateTime.of(LocalDate.of( 2019,7,5), LocalTime.of(19,30), ZoneId.systemDefault()));

        Reading reading5 = new Reading("Achen", "Kakooza", 36,
                Arrays.asList(Strings.SYMPTOM_HEADACHE, Strings.SYMPTOM_BLURRED_VISION),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_NONE, "0",
                99, 60, 99,
                ZonedDateTime.of(LocalDate.of( 2019,7,16), LocalTime.of(7,45), ZoneId.systemDefault()));

        Reading reading6 = new Reading("Achen", "Kakooza", 36,
                Arrays.asList("Back Pain", Strings.SYMPTOM_BLEEDING),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_WEEKS, "2",
                178, 150, 127,
                ZonedDateTime.of(LocalDate.of( 2019,8,2), LocalTime.of(10,23), ZoneId.systemDefault()));

        Reading reading7 = new Reading("Kizza", "Alupo", 76,
                Arrays.asList(Strings.SYMPTOM_HEADACHE, Strings.SYMPTOM_BLURRED_VISION),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "8",
                170, 127, 139,
                ZonedDateTime.of(LocalDate.of( 2019,6,1), LocalTime.of(4,0), ZoneId.systemDefault()));

        Reading reading8 = new Reading("Jeje", "Kony", 26,
                Arrays.asList(Strings.SYMPTOM_ABDOMINAL_PAIN, "Leg Pain"),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "3",
                150, 89, 100,
                ZonedDateTime.of(LocalDate.of( 2019,2,23), LocalTime.of(5,9), ZoneId.systemDefault()));

        Reading reading9 = new Reading("Kahinda", "Otafiire", 26,
                Arrays.asList(Strings.SYMPTOM_HEADACHE, Strings.SYMPTOM_BLURRED_VISION),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "7",
                180, 130, 98,
                ZonedDateTime.of(LocalDate.of( 2019,1,12), LocalTime.of(17,49), ZoneId.systemDefault()));

        Reading reading10 = new Reading("Kahinda", "Otafiire", 26,
                Arrays.asList(Strings.SYMPTOM_UNWELL, Strings.SYMPTOM_FEVERISH),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "8",
                120, 80, 70,
                ZonedDateTime.of(LocalDate.of( 2019,2,12), LocalTime.of(15,33), ZoneId.systemDefault()));

        Reading reading11 = new Reading("Natukunda", "Mbira", 22,
                Arrays.asList(Strings.SYMPTOM_UNWELL, Strings.SYMPTOM_BLURRED_VISION, Strings.SYMPTOM_ABDOMINAL_PAIN),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_NONE, "0",
                118, 88, 79,
                ZonedDateTime.of(LocalDate.of( 2019,12,12), LocalTime.of(23,29), ZoneId.systemDefault()));

        Reading reading12 = new Reading("Abbo", "Kakooza", 29,
                Arrays.asList(Strings.SYMPTOM_BLURRED_VISION),
                GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS, "5",
                122, 100, 90,
                ZonedDateTime.of(LocalDate.of( 2019,8,27), LocalTime.of(11,47), ZoneId.systemDefault()));

        List<Reading> readings1 = Arrays.asList(reading1, reading2, reading3, reading4, reading12);
        List<Reading> readings2 = Arrays.asList(reading5, reading6);
        List<Reading> readings6 = Arrays.asList(reading11);
        List<Reading> readings8 = Arrays.asList(reading7);
        List<Reading> readings10 = Arrays.asList(reading8);
        List<Reading> readings11 = Arrays.asList(reading9, reading10);

        patient1.addAllReadings(readings1);
        patient2.addAllReadings(readings2);
        patient6.addAllReadings(readings6);
        patient8.addAllReadings(readings8);
        patient10.addAllReadings(readings10);
        patient11.addAllReadings(readings11);

        readings1.forEach(r -> r.setPatient(patient1));
        readings2.forEach(r -> r.setPatient(patient2));
        readings6.forEach(r -> r.setPatient(patient6));
        readings8.forEach(r -> r.setPatient(patient8));
        readings10.forEach(r -> r.setPatient(patient10));
        readings11.forEach(r -> r.setPatient(patient11));

        Analysis analysis1 = new Analysis(reading1);
        Analysis analysis2 = new Analysis(reading2);
        Analysis analysis3 = new Analysis(reading3);
        Analysis analysis4 = new Analysis(reading4);

        List<Analysis> analyses = Arrays.asList(analysis1, analysis2, analysis3, analysis4);

        patientRepository.saveAll(patients);

        readingRepository.saveAll(readings1);
        readingRepository.saveAll(readings2);
        readingRepository.saveAll(readings6);
        readingRepository.saveAll(readings8);
        readingRepository.saveAll(readings10);
        readingRepository.saveAll(readings11);

        analysisRepository.saveAll(analyses);

        SupervisorPatientPair supervisorPatientPair1 = new SupervisorPatientPair("test@test.com", patient1.getPatientId().toString());
        SupervisorPatientPair supervisorPatientPair2 = new SupervisorPatientPair("test@test.com", patient2.getPatientId().toString());
        SupervisorPatientPair supervisorPatientPair3 = new SupervisorPatientPair("test@test.com", patient3.getPatientId().toString());
        supervisorRepository.saveAll(Arrays.asList(supervisorPatientPair1, supervisorPatientPair2, supervisorPatientPair3));
    }
}
