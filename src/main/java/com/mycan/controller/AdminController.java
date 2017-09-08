package com.mycan.controller;

import com.mycan.entity.Question;
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
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    QuestionService questionService;

    @RequestMapping("questionsList")
    public String questionsList(Model model) {

        List<Question> list = questionService.getQuestionList();
        model.addAttribute("questionsList", list);
        return "questionsList";
    }

}
