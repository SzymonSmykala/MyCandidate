CREATE PROCEDURE getNumberOfquestions (OUT param1 INT)
  BEGIN
    SELECT COUNT(*) INTO param1 FROM questions;
  END;