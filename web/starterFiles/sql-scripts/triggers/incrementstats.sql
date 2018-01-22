DROP TRIGGER IF EXISTS incrementStats;
CREATE TRIGGER incrementStats
AFTER INSERT ON answers
FOR EACH ROW
  BEGIN
    UPDATE stats
    SET numberofanswers = numberofanswers + 1
    WHERE date = DATE (NOW());
  END;