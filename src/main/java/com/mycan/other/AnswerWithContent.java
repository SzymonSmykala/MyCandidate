package com.mycan.other;

public class AnswerWithContent {
    private int questionId;
    private String questionContent;
    private String answer;


    public AnswerWithContent(int questionId, String questionContent) {
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

    public AnswerWithContent() {
    }

    public AnswerWithContent(int questionId) {
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
