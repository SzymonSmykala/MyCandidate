DROP TRIGGER IF EXISTS newDayStats;
CREATE TRIGGER newDayStats
BEFORE INSERT on my_candidate.answers
FOR EACH ROW
  BEGIN
    INSERT INTO stats(date, numberofanswers) VALUES (DATE(NOW()),0)
    ON DUPLICATE KEY UPDATE date = VALUES(date);

  END;