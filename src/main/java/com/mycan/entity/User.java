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
    int userId;

    @Column(name = "email")
    String email;

    @Column(name = "password")
    String password;

    @Column(name = "first_name")
    String firstName;

    @Column(name = "last_name")
    String lastName;

    @Column(name = "role")
    String role;


}
