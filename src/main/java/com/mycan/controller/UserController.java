package com.mycan.controller;

import com.mycan.otherclasses.AnswerNE;
import com.mycan.otherclasses.AnswerForm;
import com.mycan.entity.Question;
import com.mycan.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * Created by Szymon on 04.11.2017.
 */
@Controller
@RequestMapping("/user")
@SessionAttributes("answerForm")
public class UserController {

    private boolean startup = true;

    @Autowired
    QuestionService questionService;

    private static List<AnswerNE> answerNES = new ArrayList<AnswerNE>();

//    static {
//
//       answerNES.add(new AnswerNE(1, "test?1"));
//       answerNES.add(new AnswerNE(2, "test?2"));
//    }

    @RequestMapping("/questionForm")
    public String showQuestionFormForUser(Model model) {

        if (startup) {
            for (Question question : questionService.getQuestionList()) {
                answerNES.add(new AnswerNE(question.getId(), question.getQuestionContent()));
            }
            startup = false;
        }
        AnswerForm answerForm = new AnswerForm();
        answerForm.setAnswerNES(answerNES);
        model.addAttribute("answerForm", answerForm);
        return "questionsFormForUser";
    }

    @GetMapping("processForm")
    public String processForm(@ModelAttribute("answerForm") AnswerForm answerForm, Model model) {
        List<AnswerNE> answerNES = answerForm.getAnswerNES();
        for (AnswerNE answerNE : answerNES) {
            System.out.println(answerNE.getQuestionId() + " " + answerNE.getQuestionContent() + " " + answerNE.getAnswer());
        }

        return "questionsFormForUser";
    }


}
