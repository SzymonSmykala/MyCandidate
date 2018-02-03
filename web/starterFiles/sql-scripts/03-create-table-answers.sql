CREATE TABLE answers
(
  id             INT AUTO_INCREMENT
    PRIMARY KEY,
  user_id        INT         NOT NULL,
  question_id    INT         NOT NULL,
  answer_content VARCHAR(45) NOT NULL,
  CONSTRAINT answers_ibfk_1
  FOREIGN KEY (question_id) REFERENCES questions (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
CREATE INDEX answers_ibfk_1
  ON answers (question_id);
