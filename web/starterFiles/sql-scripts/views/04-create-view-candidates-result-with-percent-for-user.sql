DROP VIEW IF EXISTS candidatesResultWithPercentForUser;
CREATE VIEW candidatesResultWithPercentForUser
  AS(
    SELECT U.first_name AS First_Name, U.last_name AS Last_Name, P.full_name AS Party_Name,
           CONCAT( GMC.PoprawnaLiczbaOdp / (SELECT COUNT(*) FROM my_candidate.questions)*100, "%") as PercentOFMatch FROM getmatchtedcandidates AS GMC
      INNER JOIN users AS U ON U.user_id = GMC.user_id
      INNER JOIN candidate_details AS CD ON U.user_id = CD.user_id
      JOIN parties AS P ON CD.party_shortcut = P.party_shorcut

  )