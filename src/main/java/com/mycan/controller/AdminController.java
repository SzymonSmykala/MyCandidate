package com.mycan.controller;

import com.mycan.entity.Answer;
import com.mycan.entity.Question;
import com.mycan.entity.User;
import com.mycan.otherclasses.AnswerForm;
import com.mycan.otherclasses.AnswerWithQuestion;
import com.mycan.service.AnswerService;
import com.mycan.service.QuestionService;
import com.mycan.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Szymon on 08.09.2017.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    QuestionService questionService;

    @Autowired
    UserService userService;

    @Autowired
    AnswerService answerService;

    private static List<AnswerWithQuestion> answerWithQuestionList = new ArrayList<AnswerWithQuestion>();
    boolean startup = true;

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
        questionService.addQuestion(question);
        return "redirect:questionsList";
    }

    @GetMapping("/addQuestion")
    public String addQuestion (Model model){
        Question question = new Question();
        model.addAttribute("question", question);
        return "addQuestionForm";
    }

    @GetMapping("deleteQuestion")
    public String deleteQuestion (@RequestParam("questionId") int theId){
        questionService.delete(theId);
        return "redirect:/admin/questionsList";
    }


    @GetMapping("editQuestion")
    public String editQuestionPage (@RequestParam ("questionId") int theId, Model model){

        Question question = questionService.getQuestion(theId);
        model.addAttribute("currentQuestion", question);

        return "editQuestionPage";
    }

    @PostMapping("editQuestionSubmit")
    public String editQuestionSubmit (@ModelAttribute("currentQuestion") Question question){

        System.out.println("CONENT: " +  question.getQuestionContent() + "     ID = " + question.getId());
        questionService.update(question);

        return "redirect:/admin/questionsList";
    }


    @RequestMapping("addUser")
    public String addUser(Model model){

        User user = new User();
        model.addAttribute("user", user);
        return "addUserForm";
    }

    @PostMapping("addUserSubmit")
    public String addUserSubmit(@ModelAttribute("user") User user){
        userService.addUser(user);
        System.out.println(user);
        return "redirect:/admin/addUser";
    }

    @RequestMapping("candidateForm")
    public String candidateForm(Model model){
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

        List<User> candidatesList = userService.getCandidatesList();

        Map<Integer,String> candidateMap = new HashMap<Integer, String>();

        for (User candidate: candidatesList){
            candidateMap.put(candidate.getUserId(), candidate.getFirstName() + " " +
                    candidate.getLastName() + " " +  candidate.getEmail());
        }

        model.addAttribute("candidates", candidateMap);
        return "questionsFormForCandidateTemp";
    }


    @GetMapping("candidateSubmit")
    public String processForm(@ModelAttribute("answerForm") AnswerForm answerForm, Model model) {

        List<AnswerWithQuestion> answerWithQuestions = answerForm.getAnswerWithQuestions();
        model.addAttribute("answerForm", answerForm);
        List<Answer> submitList = new ArrayList<Answer>();
        int candidateId = answerForm.getCurrentUserId();
        for (AnswerWithQuestion answerWithQuestion : answerWithQuestions) {
            Answer answer = new Answer(candidateId, answerWithQuestion.getAnswer(),
                    questionService.getQuestion(answerWithQuestion.getQuestionId()));
            submitList.add(answer);
        }
       answerService.submitUserAnswers(submitList);

        return "FormForUserConfirmationPage";
    }

}
