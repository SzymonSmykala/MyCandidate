package com.mycan.controller;

import com.mycan.entity.Answer;
import com.mycan.entity.AnswerForm;
import com.mycan.entity.Question;
import com.mycan.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * Created by Szymon on 04.11.2017.
 */
@Controller
@RequestMapping("/user")
@SessionAttributes("answerForm")
public class UserController {


    @Autowired
     QuestionService questionService;

    private static List<Answer> answers  = new ArrayList<Answer>();

    static {

       answers.add(new Answer(1, "test?1"));
       answers.add(new Answer(2, "test?2"));
    }

    @RequestMapping("/questionForm")
    public String showQuestionFormForUser(Model model){

        AnswerForm answerForm = new AnswerForm();
        answerForm.setAnswers(answers);
        model.addAttribute("answerForm", answerForm);
        return "questionsFormForUser";
    }

    @GetMapping("processForm")
    public String processForm(@ModelAttribute("answerForm") AnswerForm answerForm, Model model){
        List<Answer> answers = answerForm.getAnswers();
        for (Answer answer: answers){
            System.out.println(answer.getQuestionId() + " " + answer.getQuestionContent() + " " + answer.getAnswer());
        }
        return "questionsFormForUser";
    }



}
