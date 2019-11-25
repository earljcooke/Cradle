package com.mercury.TeamMercuryCradlePlatform.controller;

import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Referral;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.model.comparators.ReferralSortByAssessmentStatus;
import com.mercury.TeamMercuryCradlePlatform.repository.PatientRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReferralRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.List;

@Controller
@Service
@RequestMapping(path="/referral")
public class ReferralController {
    @Autowired
    private ReferralRepository referralRepository;
    private ReadingRepository readingRepository;
    private PatientRepository patientRepository;

    public ReferralController(ReferralRepository referralRepository, ReadingRepository readingRepository, PatientRepository patientRepository) {
        this.referralRepository = referralRepository;
        this.readingRepository = readingRepository;
        this.patientRepository = patientRepository;
    }

    @RequestMapping(value = "/addReferral", method = RequestMethod.GET)
    public ModelAndView addReferralPage(){
        return new ModelAndView("/referral/addReferral");
    }

    @RequestMapping(value = "/confirmReferral", method = RequestMethod.POST)
    public @ResponseBody ModelAndView confirmReferralPage(Referral referral) {
        ModelAndView modelAndView = new ModelAndView("/referral/confirmReferral");

        Reading reading = readingRepository.findReadingByFirstNameAndLastNameAndAgeYearsAndBpSystolicAndBpDiastolicAndHeartRateBPM(referral.getFirstName(), referral.getLastName(), referral.getAgeYears(), referral.getBpSystolic(), referral.getBpDiastolic(), referral.getHeartRateBPM());
        Patient patient = patientRepository.findByFirstNameAndLastNameAndAgeYears(referral.getFirstName(), referral.getLastName(), referral.getAgeYears());
        if (referral.getDateTimeSent() == null) {
            referral.setDateTimeSent(ZonedDateTime.now());
        }
        referral.setReading(reading);
        referral.setPatient(patient);
        modelAndView.addObject("referral", referral);
        return modelAndView;
    }

    @RequestMapping(value = "/referralList", method = RequestMethod.GET)
    public ModelAndView ReferralListPage() {
        List<Referral> referralList = this.referralRepository.findAll();
        referralList.sort(new ReferralSortByAssessmentStatus());
        ModelAndView modelAndView = new ModelAndView("/referral/referralList");
        modelAndView.addObject("referralList", referralList);
        return modelAndView;
    }

    @RequestMapping(value = "/referralSaved", method = RequestMethod.POST)
    public @ResponseBody ModelAndView saveReferral(Referral referral) {

        Patient patient = patientRepository.findByFirstNameAndLastNameAndAgeYears(referral.getFirstName(), referral.getLastName(), referral.getAgeYears());
        referral.setPatient(patient);

        Reading reading = readingRepository.findTopByFirstNameAndLastNameAndAgeYearsAndBpSystolicAndBpDiastolicAndHeartRateBPMOrderByDateTimeTakenDesc
                (referral.getFirstName(), referral.getLastName(), referral.getAgeYears(),
                        referral.getBpSystolic(), referral.getBpDiastolic(), referral.getHeartRateBPM());
        referral.setReading(reading);
        if (referral.getDateTimeSent() == null) {
            referral.setDateTimeSent(ZonedDateTime.now());
        }
        referral.setIsPregnant(reading.getGestationalAgeInWeeksAndDays() != null);
        referralRepository.save(referral);

        List<Referral> referralList = this.referralRepository.findAll();
        referralList.sort(new ReferralSortByAssessmentStatus());
        ModelAndView modelAndView = new ModelAndView("/referral/referralList");
        modelAndView.addObject("referralList", referralList);
        return modelAndView;
    }

    @RequestMapping(value = "/close/{id}", method = RequestMethod.POST)
    public ModelAndView deleteReferralById(@PathVariable Long id){
        this.referralRepository.delete(this.referralRepository.findByReferralId(id));
        List<Referral> referralList = this.referralRepository.findAll();
        referralList.sort(new ReferralSortByAssessmentStatus());
        ModelAndView modelAndView = new ModelAndView("/referral/referralList");
        modelAndView.addObject("referralList", referralList);
        return modelAndView;
    }

    @RequestMapping(value = "/info/{id}", method = RequestMethod.GET)
    public ModelAndView getReferralInfoById(@PathVariable Long id) {
        Referral referral = this.referralRepository.findByReferralId(id);
        Reading reading = readingRepository.findReadingByFirstNameAndLastNameAndAgeYearsAndBpSystolicAndBpDiastolicAndHeartRateBPM(referral.getFirstName(), referral.getLastName(), referral.getAgeYears(), referral.getBpSystolic(), referral.getBpDiastolic(), referral.getHeartRateBPM());
        ModelAndView modelAndView = new ModelAndView("/referral/referralInfo");
        modelAndView.addObject("referral", referral);
        modelAndView.addObject("reading", reading);
        return modelAndView;
    }



}
