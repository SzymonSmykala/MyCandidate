package com.mycan.dao;

import com.mycan.entity.Answer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

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

    @Transactional
    public List<Answer> getAnswersByUserId(int userId) {
        Session session = sessionFactory.getCurrentSession();
        List<Answer> answersList = session.createQuery("from Answer a WHERE a.userId = " + userId).list();
        return answersList;
    }

    @Transactional
    public void submitUserAnswers(List<Answer> submitList) {
        Session session = sessionFactory.getCurrentSession();
        for (Answer answer: submitList){
            session.save(answer);
        }
    }
}
