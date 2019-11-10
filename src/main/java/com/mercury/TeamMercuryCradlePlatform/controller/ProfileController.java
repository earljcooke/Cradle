package com.mercury.TeamMercuryCradlePlatform.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mercury.TeamMercuryCradlePlatform.model.User;
import com.mercury.TeamMercuryCradlePlatform.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/profile")
@SessionAttributes("user")
public class ProfileController {
    @Autowired
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    public ProfileController(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @PreAuthorize("#id == authentication.getPrincipal().getUserId()")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView getUserInfo(@PathVariable("id") Integer id, Model model) {

        User user = userRepository.findByUserId(id);
        ModelAndView modelAndView = new ModelAndView("/profile");

        model.addAttribute("UserId", id);
        model.addAttribute("FirstName", user.getFirstName());
        model.addAttribute("LastName", user.getLastName());
        model.addAttribute("Role", user.getRole());

        return modelAndView;
    }

    @RequestMapping(value = "/{id}/edit", method = RequestMethod.POST)
    public ModelAndView getEditUserPage(@PathVariable("id") Integer id) {
        User user = this.userRepository.findByUserId(id);

        ModelAndView modelAndView = new ModelAndView("/profile/edit");
        modelAndView.addObject("postUser", user);
        return modelAndView;
    }

    @RequestMapping(value = "/{id}/save", method = RequestMethod.POST)
    public ModelAndView getSavedUserPage(@PathVariable("id") Integer id, User user, @RequestParam(value = "roles", defaultValue = "") String roles) {

        user.setRole(roles);
        this.userRepository.save(user);

        ModelAndView modelAndView = new ModelAndView("/profile/save");
        return modelAndView;
    }

}
