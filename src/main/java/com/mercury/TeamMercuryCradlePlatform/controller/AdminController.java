package com.mercury.TeamMercuryCradlePlatform.controller;

import com.mercury.TeamMercuryCradlePlatform.Service.ContactService;
import com.mercury.TeamMercuryCradlePlatform.authentication.UserLogin;
import com.mercury.TeamMercuryCradlePlatform.model.EmailAdmin;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis;
import com.mercury.TeamMercuryCradlePlatform.model.User;
import com.mercury.TeamMercuryCradlePlatform.repository.PatientRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/admin")
@SessionAttributes("user")
public class AdminController {
    @Autowired
    private UserRepository userRepository;
    private EmailAdmin emailAdmin;
    private ReadingRepository readingRepository;
    private PatientRepository patientRepository;

    public AdminController(UserRepository userRepository, EmailAdmin emailAdmin, ReadingRepository readingRepository,
            PatientRepository patientRepository) {
        this.userRepository = userRepository;
        this.emailAdmin = emailAdmin;
        this.readingRepository = readingRepository;
        this.patientRepository = patientRepository;
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView viewAllReadings() {
        List<Reading> readings = this.readingRepository.findAll();

        for (Reading r : readings) {
            r.symptoms = new ArrayList<>(Arrays.asList(r.symptomsString.split(",")));
        }

        return new ModelAndView("/reading/all").addObject("readingList", readings);
    }

    @GetMapping("/education")
    public String educationPage() {
        return "admin/education";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public @ResponseBody ModelAndView registrationPage() {
        return new ModelAndView("admin/registration");
    }

    @RequestMapping(value = "/submitRegistration", method = RequestMethod.POST)
    public @ResponseBody ModelAndView submitRegistration(User user, @RequestParam String password,
            @RequestParam String roles) {
        User newUser = new User(user, password);
        newUser.setEncodedPassword(newUser.getPassword());
        newUser.setRole(roles);

        userRepository.save(newUser);

        emailAdmin.sendRegistrationEmail(password, newUser);
        return getAllUsers();
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ModelAndView getAllUsers() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Integer userId = ((UserLogin) authentication.getPrincipal()).getUserId();
        return new ModelAndView("/admin/users")
                .addObject("users", this.userRepository.findAllNotMe(userId));
    }

    @RequestMapping(value = "/users/contact", method = RequestMethod.GET)
    public ModelAndView getContactPage(@RequestParam int userId, @RequestParam String name) {
        User user = userRepository.findByUserId(userId);

        return new ModelAndView("/admin/contact")
            .addObject("email", user.getEmail())
            .addObject("phoneNumber", user.getPhoneNumber())
            .addObject("name", name);
    }

    @RequestMapping(value = "/submitMessage", method = RequestMethod.POST)
    public ModelAndView sendMessage(@RequestParam String email, @RequestParam String subject,
            @RequestParam String contactMethod, @RequestParam String message, @RequestParam String phoneNumber) {
        ContactService contactService = new ContactService();
        contactService.sendMessage(contactMethod, email, phoneNumber, subject, message);

        return new ModelAndView("/admin/users").addObject("users", this.userRepository.findAll());
    }

    @RequestMapping(value = "/users/edit", method = RequestMethod.POST)
    public ModelAndView getAllUsers(User user, @RequestParam(value = "roles", defaultValue = "") String roles,
            @RequestParam(value = "password") String password) {
        user.setRole(roles);
        user.setPassword(password);

        this.userRepository.save(user);

        return new ModelAndView("/admin/users").addObject("users", this.userRepository.findAll());
    }

    @RequestMapping(value = "/users/{id}", method = RequestMethod.GET)
    public ModelAndView getUserWithId(@PathVariable int id) {
        User user = this.userRepository.findByUserId(id);

        return new ModelAndView("/admin/editUser").addObject("postUser", user);
    }

    @RequestMapping(value = "/users/delete/{id}", method = RequestMethod.POST)
    public ModelAndView deleteUserWithId(@PathVariable int id) {
        this.userRepository.delete(this.userRepository.findByUserId(id));

        return new ModelAndView("/admin/users").addObject("users", this.userRepository.findAll());
    }

}
