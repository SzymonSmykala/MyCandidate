package com.mycan.dao;

import com.mycan.entity.Question;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class QuestionDAOImpl implements QuestionDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Transactional
    public Question getQuestion(int theId) {

        Session session = sessionFactory.getCurrentSession();
        Question question = session.get(Question.class, theId);
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

    @Transactional
    public void delete(int theId) {
        Session session = sessionFactory.getCurrentSession();
        Question question = session.get(Question.class, theId);
        session.delete(question);
    }


    @Transactional
    public void update(Question question) {
        Session session = sessionFactory.getCurrentSession();
        session.update(question);
    }
}
