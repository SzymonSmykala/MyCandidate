package com.mycan.entity;

import javax.persistence.*;

/**
 * Created by Szymon on 08.09.2017.
 */
@Entity
@Table(name = "questions")
public class Question {
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "question_content")
    private String questionContent;

    public Question() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", questionContent='" + questionContent + '\'' +
                '}';
    }
}
