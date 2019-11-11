package com.mercury.TeamMercuryCradlePlatform.model;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Entity
@Table(name = "user")               //Role = ADMIN, HEALTH WORKER, VHT
public class User {


    public enum Role {
        VHT,
        HEALTH_WORKER,
        ADMIN;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id")
    private Integer userId;

    public User() {

    }

    public User(User user) {
        this.userId = user.userId;
        this.password = user.password;
//        setEncodedPassword(user.password);
        this.firstName = user.firstName;
        this.lastName = user.lastName;
        this.roles = user.roles;
        this.email = user.email;
        this.phoneNumber = user.phoneNumber;
    }

    public User(User user, String password) {
        this.userId = user.userId;
        this.password = user.password;
//        setEncodedPassword(password);
        this.firstName = user.firstName;
        this.lastName = user.lastName;
        this.roles = user.roles;
        this.email = user.email;
        this.phoneNumber = user.phoneNumber;
    }

    public User(String password, String firstName, String lastName, String email, String roles, String phoneNumber) {
        this.password = password;
//        setEncodedPassword(password);
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.roles = roles;
        this.phoneNumber = phoneNumber;
    }


    public User(String encode, String john, String lee, String s, String admin) {
    }


    @Column(name = "email")
    private String email = null;

    @Column(name = "phone_number")
    private String phoneNumber = null;

    @Column(name = "password")
    private String password = null;

    @Column(name = "first_Name")
    private String firstName = null;

    @Column(name = "last_Name")
    private String lastName = null;

    @Column(name = "roles")
    private String roles = null;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password;
    }

    public void setEncodedPassword(String password) {
        this.password = encodePassword(password);
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }


    public String getRole() {
        return roles;
    }

    public void setRole(String roles) {
        this.roles = roles;
    }

    public List<String> getRoles() {
        if(this.roles.length() > 0) {
            return Arrays.asList(this.roles.split(","));
        } else {
            return new ArrayList<>();
        }
    }

    public String getRolesAsString() {
        return this.roles;
    }

    public String encodePassword(String password) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        return bCryptPasswordEncoder.encode(password);
    }

    public boolean isVHT(){
        return getRoles().stream().anyMatch(str -> str.trim().equals(Role.VHT.toString()));
    }

    public boolean isHealthWorker(){
        return getRoles().stream().anyMatch(str -> str.trim().equals(Role.HEALTH_WORKER.toString()));
    }

    public boolean isAdmin(){
        return getRoles().stream().anyMatch(str -> str.trim().equals(Role.ADMIN.toString()));
    }

    @Override
    public String toString(){
        return "Name: " + firstName + " " +  lastName + "\nEmail: " + email + "\nRoles:" + roles;
    }

}
