package com.mycan.dao;

import com.mycan.entity.Answer;
import com.mycan.service.QuestionService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Repository
public class AnswerDAOImpl implements AnswerDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Autowired
    QuestionService questionService;

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
        for (Answer answer : submitList) {
            session.save(answer);
        }
    }

    @Transactional
    public List<Answer> getMatchedCandidatesAnswers(int theUserId) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createNativeQuery("SELECT A.id, A.user_id, A.question_id, A.answer_content" +
                " FROM answers as A JOIN users as U on U.user_id = A.user_id WHERE U.role = 'CANDIDATE'");

        List<Answer> answerListFromQuery = createAnswerListFromQuery(query);
      return  calculateMatchedAnswers(answerListFromQuery, theUserId);


    }
    @Transactional
    public void deleteAnswersByUserId(int theUserId) {
        Session session = sessionFactory.getCurrentSession();
        session.createQuery("delete from Answer a where a.userId =" + theUserId).executeUpdate();

    }

    private List<Answer> calculateMatchedAnswers(List<Answer> answerListFromQuery, int theUserId) {
        List<Answer> resultList = new ArrayList<Answer>();
        List<Answer> userAnswers = getAnswersByUserId(theUserId);

        for (Answer candidateAnswer: answerListFromQuery){
            for (Answer userAnswer: userAnswers){
                if (candidateAnswer.getQuestion() == userAnswer.getQuestion() && candidateAnswer.getAnswerContent().equals(userAnswer.getAnswerContent()) ){
                    resultList.add(candidateAnswer);
                }
            }
        }
        return resultList;
    }

    private List<Answer> createAnswerListFromQuery(Query query) {
        List<Object[]> res = query.getResultList();
        List<Answer> list = new ArrayList<Answer>();

        Iterator it = res.iterator();
        while(it.hasNext()){
            Object[] line = (Object[]) it.next();
            Answer answer = new Answer();
            answer.setId((Integer) line[0]);
            answer.setUserId((Integer) line[1]);
            answer.setQuestion(questionService.getQuestion((Integer) line[2]));
            answer.setAnswerContent((String) line[3]);

            list.add(answer);
        }
        return list;
    }


}
