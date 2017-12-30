package com.mycan.controller;

import com.mycan.entity.Answer;
import com.mycan.otherclasses.AnswerWithQuestion;
import com.mycan.otherclasses.AnswerForm;
import com.mycan.entity.Question;
import com.mycan.service.AnswerService;
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

    @Autowired
    AnswerService answerService;


    private static List<AnswerWithQuestion> answerWithQuestionList = new ArrayList<AnswerWithQuestion>();


    @RequestMapping("/questionForm")
    public String showQuestionFormForUser(Model model) {

        if (startup) {
            for (Question question : questionService.getQuestionList()) {
                AnswerWithQuestion answerWithQuestion = new AnswerWithQuestion(question.getId(), question.getQuestionContent());
                answerWithQuestion.setAnswer("No answer");
                answerWithQuestionList.add(answerWithQuestion);
            }
            startup = false;
        }
        AnswerForm answerForm = new AnswerForm();
        answerForm.setAnswerWithQuestions(answerWithQuestionList);
        model.addAttribute("answerForm", answerForm);
        return "questionsFormForUser";
    }

    @GetMapping("processForm")
    public String processForm(@ModelAttribute("answerForm") AnswerForm answerForm, Model model) {
        List<AnswerWithQuestion> answerWithQuestions = answerForm.getAnswerWithQuestions();
        for (AnswerWithQuestion answerWithQuestion : answerWithQuestions) {
            System.out.println(answerWithQuestion.getQuestionId() + " " + answerWithQuestion.getQuestionContent() + " " + answerWithQuestion.getAnswer());
           
        }
        model.addAttribute("answerForm", answerForm);

        //Create AnswerList
        System.out.println("KURWO CHAMSKA");
        List<Answer> submitList = new ArrayList<Answer>();
        for (AnswerWithQuestion answerWithQuestion: answerWithQuestions){
            //TODO: set real userID
            Answer answer = new Answer(0, answerWithQuestion.getAnswer(),
                    questionService.getQuestion(answerWithQuestion.getQuestionId()));

            System.out.println(answer + "   question: " + answer.getQuestion().getQuestionContent()
            + " id " + answer.getQuestion().getId());
             submitList.add(answer);
        }

        //Submit to DB with userId = 0

        answerService.submitUserAnswers(submitList);

        return "FormForUserConfirmationPage";
    }


}
