package com.mycan.dao;

import com.mycan.entity.Answer;

import java.util.List;

/**
 * Created by Szymon on 19.11.2017.
 */
public interface AnswerDAO {

    Answer getAnswer(int theId);
    void setAnswer(Answer answer);
    List<Answer> getAnswersByUserId(int userId);
}
