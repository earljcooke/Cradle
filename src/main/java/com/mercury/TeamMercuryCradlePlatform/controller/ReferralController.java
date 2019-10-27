package com.mercury.TeamMercuryCradlePlatform.controller;

import com.mercury.TeamMercuryCradlePlatform.model.Patient;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.model.Referral;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReferralRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.List;

@Controller
@Service
@RequestMapping(path="/referral")
public class ReferralController {
    @Autowired
    private ReferralRepository referralRepository;
    private ReadingRepository readingRepository;

    public ReferralController(ReferralRepository referralRepository, ReadingRepository readingRepository) {
        this.referralRepository = referralRepository;
        this.readingRepository = readingRepository;
    }

    @RequestMapping(value = "/addReferral", method = RequestMethod.GET)
    public ModelAndView addReferralPage(){
        return new ModelAndView("/referral/addReferral");
    }

    @RequestMapping(value = "/confirmReferral", method = RequestMethod.POST)
    public @ResponseBody ModelAndView confirmReferralPage(Referral referral) {
        ModelAndView modelAndView = new ModelAndView("/referral/confirmReferral");
        referral.setDateTimeSent(LocalDate.now());
        modelAndView.addObject("referral", referral);
        return modelAndView;
    }

    @RequestMapping(value = "/referralList", method = RequestMethod.GET)
    public ModelAndView ReferralListPage() {
        List<Referral> referralList = this.referralRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("/referral/referralList");
        modelAndView.addObject("referralList", referralList);
        return modelAndView;
    }

    @RequestMapping(value = "/referralSaved", method = RequestMethod.POST)
    public @ResponseBody ModelAndView saveReferral(Referral referral) {
        ModelAndView modelAndView = new ModelAndView("/referral/referralList");
        referral.setDateTimeSent(LocalDate.now());
        referralRepository.save(referral);

        List<Referral> referralList = this.referralRepository.findAll();
        modelAndView.addObject("referralList", referralList);
        return modelAndView;
    }


}
