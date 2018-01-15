DROP VIEW IF EXISTS getcandidatesanswers;
CREATE VIEW getCandidatesAnswers AS
  SELECT
    `a`.`user_id`        AS `user_id`,
    `a`.`question_id`    AS `question_id`,
    `a`.`answer_content` AS `answer_content`
  FROM (`my_candidate`.`users` `u`
    JOIN `my_candidate`.`answers` `a` ON ((`a`.`user_id` = `u`.`user_id`)))
  WHERE (`u`.`role` = 'CANDIDATE');
