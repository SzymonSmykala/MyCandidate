package com.mycan.controller;

import com.mycan.entity.Question;
import com.mycan.service.QuestionService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping("login")
    public String loginPage(){

        return "loginPage";
    }


    @PostMapping("/saveQuestion")
    public String saveQuestion(@ModelAttribute Question question ){
        //TODO: add question to database
        questionService.addQuestion(question);
        return "redirect:questionsList";
    }

    @GetMapping("/addQuestion")
    public String addQuestion (Model model){
        Question question = new Question();
        model.addAttribute("question", question);
        return "addQuestionForm";
    }

}
