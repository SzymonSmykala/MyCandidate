package com.mycan.entity;

import com.sun.javafx.beans.IDProperty;

import javax.persistence.*;

/**
 * Created by Szymon on 31.12.2017.
 */
@Entity
@Table(name = "users")
public class User {

    @Id
    @Column(name = "user_id")
    private int userId;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "role")
    private String role;

    @Transient
    private int numberOfMatchedAnswers;

    @Transient
    private double percentOfMatch;


    public double getPercentOfMatch() {
        return percentOfMatch;
    }

    public void setPercentOfMatch(double percentOfMatch) {
        this.percentOfMatch = percentOfMatch;
    }

    public int getNumberOfMatchedAnswers() {
        return numberOfMatchedAnswers;
    }

    public void setNumberOfMatchedAnswers(int numberOfMatchedAnswers) {
        this.numberOfMatchedAnswers = numberOfMatchedAnswers;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", role='" + role + '\'' +
                '}';
    }

    public void incrementNumberOfMatchedAnswers(){
        numberOfMatchedAnswers++;
    }

    public void calculatePercentOfMatch(int numberOfQuestions){
        percentOfMatch = (double) numberOfMatchedAnswers / (double) numberOfQuestions * 100;
    }
}
