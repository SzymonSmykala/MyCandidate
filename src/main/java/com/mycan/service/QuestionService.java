package com.mycan.service;

import com.mycan.entity.Question;
import org.springframework.stereotype.Service;

/**
 * Created by Szymon on 08.09.2017.
 */


public interface QuestionService {
    Question getQuestion(int theId);
}
