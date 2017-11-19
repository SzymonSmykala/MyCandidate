package com.mycan.dao;

import com.mycan.entity.Answer;

/**
 * Created by Szymon on 19.11.2017.
 */
public interface AnswerDAO {

    Answer getAnswer(int theId);
    void setAnswer(Answer answer);
}
