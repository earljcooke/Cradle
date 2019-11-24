package com.mercury.TeamMercuryCradlePlatform.controller;
import com.mercury.TeamMercuryCradlePlatform.model.Assessment;
import com.mercury.TeamMercuryCradlePlatform.model.Medication;
import com.mercury.TeamMercuryCradlePlatform.model.Referral;
import com.mercury.TeamMercuryCradlePlatform.repository.AssessmentRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.MedicationRepository;
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

    public AssessmentController(ReferralRepository referralRepository, AssessmentRepository assessmentRepository, MedicationRepository medicationRepository) {
        this.referralRepository = referralRepository;
        this.assessmentRepository = assessmentRepository;
        this.medicationRepository = medicationRepository;
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

        Assessment savedAssessment = assessmentRepository.save(assessment);
        referralRepository.save(referral);

        List<Medication> medicationList = savedAssessment.getMedications();

        // Do not replace with foreach loop!

        for (int i = 0; i < medicationList.size(); i++) {
            Medication medication = medicationList.get(i);
            medication.setStartDate(LocalDate.now());
            medication.calculateFinishDate();
            medication.setAssessment(savedAssessment);
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
}
