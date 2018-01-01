package com.mycan.service;

import com.mycan.dao.UserDAO;
import com.mycan.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Szymon on 31.12.2017.
 */
@Service
public class UserServiceImlp implements UserService {

    @Autowired
    UserDAO userDAO;

    public void addUser(User user) {
        userDAO.addUser(user);
    }
}
