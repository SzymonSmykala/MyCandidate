package com.mycan.controller;

import com.mycan.entity.Answer;
import com.mycan.entity.Question;
import com.mycan.service.AnswerService;
import com.mycan.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Szymon on 08.09.2017.
 */

@Controller
public class TempController {

    @Autowired
    QuestionService questionService;

    @Autowired
    AnswerService answerService;

    @RequestMapping("/temp")
    public String tempPage(Model model){
        int theId = 1;
        Question question = questionService.getQuestion(theId);
        System.out.println(question);
        model.addAttribute("firstRow", question);
        return "temp";
    }

}
