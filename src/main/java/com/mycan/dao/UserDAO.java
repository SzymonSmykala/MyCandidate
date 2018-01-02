package com.mycan.dao;

import com.mycan.entity.User;

import java.util.List;

/**
 * Created by Szymon on 31.12.2017.
 */
public interface UserDAO {
    void addUser(User user);

    List<User> getCandidatesList();
}
