package com.mycan.dao;

import com.mycan.entity.Answer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
public class AnswerDAOImpl implements AnswerDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Transactional
    public Answer getAnswer(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Answer answer = session.get(Answer.class, theId);
        return answer;
    }

    @Transactional
    public void setAnswer(Answer answer) {
        Session session = sessionFactory.getCurrentSession();
        session.save(answer);
    }
}
