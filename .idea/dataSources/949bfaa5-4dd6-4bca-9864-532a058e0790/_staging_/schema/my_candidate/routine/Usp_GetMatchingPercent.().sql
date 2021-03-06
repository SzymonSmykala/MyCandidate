DROP VIEW IF EXISTS  Usp_GetMatchingPercent;
CREATE VIEW Usp_GetMatchingPercent AS (


select SubQuery.user_id, count(SubQuery.user_id) as PoprawnaLiczbaOdp
From (
       Select A.user_id, question_id, answer_content from answers as A
         JOIN users as ui on ui.user_id = A.user_id
       Where ui.role = 'CANDIDATE'
             AND  A.question_id IN (select question_id from answers as A2
       where A2.user_id = 0)
             AND A.user_id <> 0
             AND A.answer_content = (select answer_content from answers	as t2
       where A.question_id = t2.question_id
             AND 0 = t2.user_id)
     ) as SubQuery
Group by SubQuery.user_id
ORDER BY PoprawnaLiczbaOdp DESC
)