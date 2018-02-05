DROP VIEW IF EXISTS GetMatchtedCandidatesSubquery;
CREATE VIEW GetMatchtedCandidatesSubquery AS (
  Select A.user_id as user_id, question_id, answer_content from answers as A
    JOIN users as ui on ui.user_id = A.user_id
  Where ui.role = 'CANDIDATE'
        AND  A.question_id IN (select question_id from answers as A2
  where A2.user_id = 0)
        AND A.user_id <> 0
        AND A.answer_content = (select answer_content from answers	as t2
  where A.question_id = t2.question_id
        AND 0 = t2.user_id)

);

DROP VIEW IF EXISTS  GetMatchtedCandidates;
CREATE VIEW GetMatchtedCandidates AS (
  select Subquery.user_id, count(Subquery.user_id) as PoprawnaLiczbaOdp
  From GetMatchtedCandidatesSubquery as Subquery
  Group by Subquery.user_id
  ORDER BY PoprawnaLiczbaOdp DESC
)