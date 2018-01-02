package com.mycan.otherclasses;

import com.mycan.entity.User;

import java.util.List;

public class AnswerForm {

    private List<AnswerWithQuestion> answerWithQuestions;
    private User currentUser = new User();

    public List<AnswerWithQuestion> getAnswerWithQuestions() {
        return answerWithQuestions;
    }
    public void setAnswerWithQuestions(List<AnswerWithQuestion> answerWithQuestions) {
        this.answerWithQuestions = answerWithQuestions;
    }

    public User getCurrentUser() {
        return currentUser;
    }

    public void setCurrentUser(User currentUser) {
        this.currentUser = currentUser;
    }
}
