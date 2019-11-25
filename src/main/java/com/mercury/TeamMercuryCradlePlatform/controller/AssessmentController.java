package com.mercury.TeamMercuryCradlePlatform.controller;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mercury.TeamMercuryCradlePlatform.model.Assessment;
import com.mercury.TeamMercuryCradlePlatform.model.Medication;
import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Referral;
import com.mercury.TeamMercuryCradlePlatform.repository.AssessmentRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.MedicationRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.PatientRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReferralRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/assessment")
public class AssessmentController {
    private final ReferralRepository referralRepository;
    private final AssessmentRepository assessmentRepository;
    private final MedicationRepository medicationRepository;
    private final PatientRepository patientRepository;

    public AssessmentController(ReferralRepository referralRepository, AssessmentRepository assessmentRepository, MedicationRepository medicationRepository, PatientRepository patientRepository) {
        this.referralRepository = referralRepository;
        this.assessmentRepository = assessmentRepository;
        this.medicationRepository = medicationRepository;
        this.patientRepository = patientRepository;
    }


    @RequestMapping(value = "/addAssessment/{id}" , method = RequestMethod.GET)
    public ModelAndView addAssessment (@PathVariable Long id) {
        ModelAndView assessmentModel = new ModelAndView("assessment/addAssessment");
        Referral referral = referralRepository.findByReferralId(id);
        assessmentModel.addObject("referral", referral);
        return assessmentModel;
    }

    @RequestMapping(value = "/confirmAssessment", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView confirmAssessment(Assessment assessment,
                                   @RequestParam(value = "referralId", defaultValue = "0")  Long referralId) {
        ModelAndView modelAndView = new ModelAndView("assessment/confirmAssessment");

        modelAndView.addObject("assessment", assessment);
        modelAndView.addObject("medications", assessment.getMedications());
        modelAndView.addObject("referralId", referralId);

        return modelAndView;
    }

    @RequestMapping(value = "/assessmentSaved", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView saveAssessment(Assessment assessment,
                                @RequestParam(value = "referralId", defaultValue = "0")  Long referralId) {

        Referral referral = referralRepository.findByReferralId(referralId);
        assessment.setReferral(referral);
        assessment.setDateCreated(LocalDate.now());
        referral.setIsAssessed(true);
        Patient patient = patientRepository.findByFirstNameAndLastNameAndAgeYears(referral.getFirstName(),
                referral.getLastName(), referral.getAgeYears());

        Assessment savedAssessment = assessmentRepository.save(assessment);
        referralRepository.save(referral);

        List<Medication> medicationList = savedAssessment.getMedications();

        // Do not replace with foreach loop!

        for (int i = 0; i < medicationList.size(); i++) {
            Medication medication = medicationList.get(i);
            medication.setStartDate(LocalDate.now());
            medication.calculateFinishDate();
            medication.setAssessment(savedAssessment);
            medication.setPatientId(patient.getPatientId());
            medicationRepository.save(medication);
        }

        List<Assessment> assessmentList = this.assessmentRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("/assessment/assessmentList");
        modelAndView.addObject("assessmentList", assessmentList);
        return modelAndView;
    }

    @RequestMapping(value = "/assessmentList" , method = RequestMethod.GET)
    public ModelAndView assessmentList () {
        List<Assessment> assessmentList = this.assessmentRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("/assessment/assessmentList");
        modelAndView.addObject("assessmentList", assessmentList);
        return modelAndView;
    }

    @RequestMapping(value = "/deleteAssessment/{assessmentId}" , method = RequestMethod.POST)
    public ModelAndView deleteAssessment (@PathVariable Long assessmentId) {
        Assessment deletedAssessment = this.assessmentRepository.findByAssessmentId(assessmentId);
        deletedAssessment.getReferral().setIsAssessed(false);
        this.referralRepository.save(deletedAssessment.getReferral());
        this.assessmentRepository.delete(deletedAssessment);

        List<Assessment> assessmentList = this.assessmentRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("/assessment/assessmentList");
        modelAndView.addObject("assessmentList", assessmentList);
        return modelAndView;
    }

    @RequestMapping(value = "/medicationList/{assessmentId}" , method = RequestMethod.GET)
    public ModelAndView getMedicationList (@PathVariable Long assessmentId) {
        ModelAndView medModel = new ModelAndView("assessment/medicationList");

        Assessment assessment = assessmentRepository.findByAssessmentId(assessmentId);
        String patientName = assessment.getReferral().getFirstName() + " " + assessment.getReferral().getLastName();
        List<Medication> medicationList = medicationRepository.findByAssessment(assessment);

        medModel.addObject("medicationList", medicationList);
        medModel.addObject("patientName", patientName);
        return medModel;
    }

    @RequestMapping(value = "/allMedicationList/{patientId}" , method = RequestMethod.GET)
    public ModelAndView getAllMedicationList (@PathVariable Long patientId) {
        ModelAndView allMedModel = new ModelAndView("assessment/allMedicationList");
        Patient patient = patientRepository.findByPatientId(patientId);
        String patientName = patient.getFirstName() + " " + patient.getLastName();
        List<Medication> medicationList = medicationRepository.findByPatientIdOrderByMedicationIdDesc(patientId);

        allMedModel.addObject("medicationList", medicationList);
        allMedModel.addObject("patientName", patientName);
        return allMedModel;
    }
}
