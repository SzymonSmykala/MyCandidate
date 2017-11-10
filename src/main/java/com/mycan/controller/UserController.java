package com.mycan.controller;

import com.mycan.entity.Question;
import com.mycan.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Szymon on 04.11.2017.
 */
@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    QuestionService questionService;

    @RequestMapping("/questionForm")
    public String showQuestionFormForUser(Model model){

        Map<String, String> typeOfAnswer = new HashMap<String, String>();
        List<Question> questionsList = questionService.getQuestionList();

        typeOfAnswer.put("Yes", "Yes");
        typeOfAnswer.put("No", "No");

        model.addAttribute("questionList", questionsList);
        model.addAttribute("typeOfAnswer", typeOfAnswer);
        return "questionsFormForUser";
    }


}
