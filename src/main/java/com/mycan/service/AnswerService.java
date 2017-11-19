package com.mycan.service;

import com.mycan.entity.Answer;

/**
 * Created by Szymon on 19.11.2017.
 */
public interface AnswerService {

    public Answer getAnswer(int theId);
    public void setAnswer(Answer answer);

}
