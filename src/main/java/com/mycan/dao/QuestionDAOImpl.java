package com.mycan.dao;

import com.mycan.entity.Question;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Szymon on 08.09.2017.
 */

@Repository
public class QuestionDAOImpl implements QuestionDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Transactional
    public Question getQuestion(int theId) {

        Session session = sessionFactory.getCurrentSession();
        Question question = session.get(Question.class, 1);
        return question;
    }

    @Transactional
    public List<Question> getQuestionList() {
        Session session = sessionFactory.getCurrentSession();
        List<Question> list = session.createQuery("from Question ").list();
        return list;
    }

    @Transactional
    public void addQuestion(Question question) {
        Session session = sessionFactory.getCurrentSession();
        session.save(question);
    }
}
