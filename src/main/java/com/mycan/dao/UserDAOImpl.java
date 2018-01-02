package com.mycan.dao;

import com.mycan.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Szymon on 31.12.2017.
 */
@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    SessionFactory sessionFactory;


    @Transactional
    public void addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
    }

    @Transactional
    public List<User> getCandidatesList() {

        Session session = sessionFactory.getCurrentSession();
        List<User> cadidatesList =
                session.createQuery("FROM User where role = 'CANDIDATE' ").list();
        return cadidatesList;

    }
}
