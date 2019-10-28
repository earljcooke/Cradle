package com.mercury.TeamMercuryCradlePlatform.controller;

import com.mercury.TeamMercuryCradlePlatform.Service.ContactService;
import com.mercury.TeamMercuryCradlePlatform.model.EmailAdmin;
import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.model.ReadingAnalysis;
import com.mercury.TeamMercuryCradlePlatform.model.User;
import com.mercury.TeamMercuryCradlePlatform.repository.PatientRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.ReadingRepository;
import com.mercury.TeamMercuryCradlePlatform.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/admin")
@SessionAttributes("user")
public class AdminController {
    @Autowired
    private UserRepository userRepository;
    private EmailAdmin emailAdmin;
    private ReadingRepository readingRepository;
    private PatientRepository patientRepository;

    public AdminController(UserRepository userRepository, EmailAdmin emailAdmin, ReadingRepository readingRepository, PatientRepository patientRepository) {
        this.userRepository = userRepository;
        this.emailAdmin = emailAdmin;
        this.readingRepository = readingRepository;
        this.patientRepository = patientRepository;

    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView bloodPressureGraph(){

        ModelAndView modelAndView = new ModelAndView("/admin/index");
        modelAndView.addObject("patientList", patientRepository.findAll());
        modelAndView.addObject("readingList", readingRepository.findAll());

        return modelAndView;

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
        newUser.setRole(roles);
        userRepository.save(newUser);

        emailAdmin.sendRegistrationEmail(password, newUser);

        ModelAndView modelAndView = new ModelAndView("/admin/users").addObject("users", this.userRepository.findAll());
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ModelAndView getAllUsers() {
        return new ModelAndView("/admin/users").addObject("users", this.userRepository.findAll());
    }

    @RequestMapping(value = "/users/contact", method = RequestMethod.GET)
    public ModelAndView getContactPage(@RequestParam int userId, @RequestParam String name) {
        User user = userRepository.findByUserId(userId);
        ModelAndView modelAndView = new ModelAndView("/admin/contact");
        modelAndView.addObject("email", user.getEmail());
        modelAndView.addObject("phoneNumber", user.getPhoneNumber());
        modelAndView.addObject("name", name);
        return modelAndView;
    }

    @RequestMapping(value = "/submitMessage", method = RequestMethod.POST)
    public ModelAndView sendMessage(@RequestParam String email, @RequestParam String subject,
            @RequestParam String contactMethod, @RequestParam String message, @RequestParam String phoneNumber) {
        // emailAdmin.sendEmail(email, subject, message);
        ContactService contactService = new ContactService();
        contactService.sendMessage(contactMethod, email, phoneNumber, subject, message);

        return new ModelAndView("/admin/users").addObject("users", this.userRepository.findAll());
    }

    @RequestMapping(value = "/users/edit", method = RequestMethod.POST)
    public ModelAndView getAllUsers(User user, @RequestParam(value = "roles", defaultValue = "") String roles) {

        user.setRole(roles);
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
