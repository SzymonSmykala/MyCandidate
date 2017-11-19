package com.mycan.service;

import com.mycan.dao.AnswerDAO;
import com.mycan.entity.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Szymon on 19.11.2017.
 */
@Service
public class AnswerServiceImpl implements AnswerService {

    @Autowired
    AnswerDAO answerDAO;

    public Answer getAnswer(int theId) {
        return answerDAO.getAnswer(theId);
    }

    public void setAnswer(Answer answer) {
        answerDAO.setAnswer(answer);
    }
}
