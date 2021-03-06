package com.mycan.otherclasses;

public class AnswerWithQuestion {



    private int questionId;
    private String questionContent;
    private String answer;


    public AnswerWithQuestion(int questionId, String questionContent) {
        this.questionId = questionId;
        this.questionContent = questionContent;
        answer = new String();
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public AnswerWithQuestion() {
    }

    public AnswerWithQuestion(int questionId) {
        this.questionId = questionId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
