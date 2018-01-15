package com.mycan.controller;

import com.mycan.entity.Answer;
import com.mycan.entity.User;
import com.mycan.otherclasses.AnswerWithQuestion;
import com.mycan.otherclasses.AnswerForm;
import com.mycan.entity.Question;
import com.mycan.service.AnswerService;
import com.mycan.service.QuestionService;
import com.mycan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.management.Query;
import java.util.*;

/**
 * Created by Szymon on 04.11.2017.
 */
@Controller
@RequestMapping("/user")
@SessionAttributes("answerForm")
public class UserController {

    boolean startup = true;

    @Autowired
    QuestionService questionService;

    @Autowired
    AnswerService answerService;

    @Autowired
    UserService userService;


    private static List<AnswerWithQuestion> answerWithQuestionList = new ArrayList<AnswerWithQuestion>();

    public void setStartup(boolean b){
        startup = b;
    }

    @RequestMapping("/questionForm")
    public String showQuestionFormForUser(Model model) {


            answerWithQuestionList = new ArrayList<AnswerWithQuestion>();
            for (Question question : questionService.getQuestionList()) {
                AnswerWithQuestion answerWithQuestion = new AnswerWithQuestion(question.getId(), question.getQuestionContent());
                answerWithQuestion.setAnswer("No answer");
                answerWithQuestionList.add(answerWithQuestion);
            }
            startup = false;


       for (AnswerWithQuestion answerWithQuestion: answerWithQuestionList){
            answerWithQuestion.setAnswer("No answer");
       }

        AnswerForm answerForm = new AnswerForm();
        answerForm.setAnswerWithQuestions(answerWithQuestionList);
        model.addAttribute("answerForm", answerForm);
        return "questionsFormForUser";
    }

    @GetMapping("processForm")
    public String processForm(@ModelAttribute("answerForm") AnswerForm answerForm, Model model) {
        List<AnswerWithQuestion> answerWithQuestions = answerForm.getAnswerWithQuestions();
        model.addAttribute("answerForm", answerForm);
        List<Answer> submitList = new ArrayList<Answer>();
        for (AnswerWithQuestion answerWithQuestion : answerWithQuestions) {
            //TODO: set real userID
            //Submit to DB with userId = 0
            Answer answer = new Answer(0, answerWithQuestion.getAnswer(),
                    questionService.getQuestion(answerWithQuestion.getQuestionId()));
            submitList.add(answer);
        }
        int userId = 0;
        answerService.deleteAnswersByUserId(userId);
        answerService.submitUserAnswers(submitList);

        List<User> matchedCandidates = getMatchedCandidatesList(userId);

        for (User candidate: matchedCandidates){
            System.out.println(candidate.getEmail() + " " + candidate.getPercentOfMatch());
        }
        model.addAttribute("matchedCandidates", matchedCandidates);

        return "FormForUserConfirmationPage";
    }


    public List<User> getMatchedCandidatesList(int userId){

        List<Answer> matchedAnswers =  answerService.getMatchedCandidatesAnswers(userId);
        List<User> candidates = userService.getCandidatesList();
        Map<Integer, User> candidatesMap = new HashMap<Integer, User>();

        for (User candidate: candidates){
            candidatesMap.put(candidate.getUserId(), candidate);
        }

        for (Answer answer: matchedAnswers){
            candidatesMap.get(answer.getUserId()).incrementNumberOfMatchedAnswers();
        }
        int questionsNumber = questionService.getQuestionNumber();
        for (User candidate: candidates){
            candidate.calculatePercentOfMatch(questionsNumber);
        }

       return candidates;
    }



}
