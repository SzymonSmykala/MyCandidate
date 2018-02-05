DROP PROCEDURE IF EXISTS get_last_inserted_user_id;
CREATE PROCEDURE get_last_inserted_user_id(OUT userID INT)
  BEGIN
    SELECT user_id INTO userID FROM users ORDER BY user_id DESC LIMIT 1;
  END;
