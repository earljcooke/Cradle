package com.mercury.TeamMercuryCradlePlatform.controller;
import com.mercury.TeamMercuryCradlePlatform.model.StatsCollector;
import com.mercury.TeamMercuryCradlePlatform.model.VHTPair;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReferralRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.SupervisorRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.ArrayList;

@Controller
public class VHTController {

    @Autowired
    private UserRepository userRepository;
    private SupervisorRepository supervisorRepository;
    private ReadingRepository readingRepository;
    private ReferralRepository referralRepository;
    private StatsCollector statsCollector;

    public VHTController(UserRepository userRepository, SupervisorRepository supervisorRepository,
                         ReadingRepository readingRepository, ReferralRepository referralRepository) {
        this.userRepository = userRepository;
        this.supervisorRepository = supervisorRepository;
        this.readingRepository = readingRepository;
        this.referralRepository = referralRepository;

        this.statsCollector = new StatsCollector(LocalDate.now(), this.userRepository,
                this.supervisorRepository, this.readingRepository,this.referralRepository);
    }

    @GetMapping("/vht/report")
    public String report() {
        return "vht/report";
    }

    @RequestMapping(value = "/vht/genreport", method = RequestMethod.GET)
    public ModelAndView genReport() {
        ModelAndView reportDataSets = new ModelAndView("/vht/genreport");
        ArrayList<ArrayList<Integer>> statsCollection =  statsCollector.collectYearlyStats();
        ArrayList<Integer> readingList = statsCollection.get(0);
        reportDataSets.addObject("readingList", readingList);
        ArrayList<Integer> referralList = statsCollection.get(1);
        reportDataSets.addObject("referralList", referralList);
        ArrayList<Integer> complReferralList = statsCollection.get(2);
        reportDataSets.addObject("complReferralList", complReferralList);
        ArrayList<Integer> pregnantList = statsCollection.get(3);
        reportDataSets.addObject("pregnantList", pregnantList);
        ArrayList<Integer> pregnantHelpedList = statsCollection.get(4);
        reportDataSets.addObject("pregnantHelpedList", pregnantHelpedList);

        return reportDataSets;
    }

    @RequestMapping(value = "/vht/allocation", method = RequestMethod.GET)
    public ModelAndView getListOfVHT() {
        return new ModelAndView("/vht/allocation").addObject("listOfVHT", this.userRepository.findAllByRole("VHT"));
    }

    @RequestMapping(value = "/submitAllocation", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView submitRegistration(VHTPair vhtPair) {

        String oldVhtId = vhtPair.getFirstVHT().split(" ")[0];
        String newVhtId = vhtPair.getSecondVHT().split(" ")[0];

        supervisorRepository.updateVHT(oldVhtId, newVhtId);

        return new ModelAndView("/patient/patientlist");
    }
}
