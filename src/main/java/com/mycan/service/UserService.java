package com.mycan.service;

import com.mycan.entity.User;

import java.util.List;

/**
 * Created by Szymon on 31.12.2017.
 */
public interface UserService {

    void addUser(User user);

    List<User> getCandidatesList();
}
