package com.mycan.dao;

import com.mycan.entity.Question;
import org.hibernate.SessionFactory;

/**
 * Created by Szymon on 08.09.2017.
 */
public interface QuestionDAO {


    Question getQuestion(int theId);
}