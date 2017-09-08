package com.mycan.service;

import com.mycan.dao.QuestionDAO;
import com.mycan.entity.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Szymon on 08.09.2017.
 */

@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    QuestionDAO questionDAO;

    public Question getQuestion(int theId) {
        return questionDAO.getQuestion(theId);
    }

    public List<Question> getQuestionList() {
        return questionDAO.getQuestionList();
    }
}
