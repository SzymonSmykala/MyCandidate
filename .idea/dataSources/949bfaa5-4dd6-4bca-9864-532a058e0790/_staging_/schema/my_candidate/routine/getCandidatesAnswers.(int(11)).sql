DROP PROCEDURE IF EXISTS  getCandidatesAnswers;
CREATE PROCEDURE getCandidatesAnswers()
  SELECT * FROM
(SELECT A.user_id, question_id, answer_content FROM users as U
INNER JOIN answers as A ON A.user_id = U.user_id
WHERE U.role = 'CANDIDATE') as subquery;
