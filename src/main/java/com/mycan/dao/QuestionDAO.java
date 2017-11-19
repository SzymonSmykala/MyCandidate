package com.mycan.dao;

import com.mycan.entity.Question;
import org.hibernate.SessionFactory;

import java.util.List;


public interface QuestionDAO {


    Question getQuestion(int theId);

    List<Question> getQuestionList();

    void addQuestion(Question question);

    void delete(int theId);

    void update(Question question);
}
