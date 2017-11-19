package com.mycan.dao;

import com.mycan.entity.Answer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.transaction.Transactional;

/**
 * Created by Szymon on 19.11.2017.
 */
public class AnswerDAOImpl implements AnswerDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Transactional
    public Answer getAnswer(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Answer answer = session.get(Answer.class, theId);
        return null;
    }

    @Transactional
    public void setAnswer(Answer answer) {
        Session session = sessionFactory.getCurrentSession();
        session.save(answer);
    }
}
