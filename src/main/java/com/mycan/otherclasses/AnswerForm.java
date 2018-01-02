package com.mycan.otherclasses;

import com.mycan.entity.User;

import java.util.List;

public class AnswerForm {

    private List<AnswerWithQuestion> answerWithQuestions;
    private Integer currentUserId;
    public List<AnswerWithQuestion> getAnswerWithQuestions() {
        return answerWithQuestions;
    }
    public void setAnswerWithQuestions(List<AnswerWithQuestion> answerWithQuestions) {
        this.answerWithQuestions = answerWithQuestions;
    }

    public Integer getCurrentUserId() {
        return currentUserId;
    }

    public void setCurrentUserId(Integer currentUserId) {
        this.currentUserId = currentUserId;
    }

}
