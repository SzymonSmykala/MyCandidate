package com.mycan.service;

import com.mycan.entity.Question;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Szymon on 08.09.2017.
 */


public interface QuestionService {
    Question getQuestion(int theId);

    List<Question> getQuestionList();

    void addQuestion(Question question);

    void delete(int theId);

    void update(Question question);
}
