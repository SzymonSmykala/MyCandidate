DROP TRIGGER IF EXISTS incrementCandidatesStats;
CREATE TRIGGER incrementCandidatesStats
BEFORE INSERT ON my_candidate.users
FOR EACH ROW
  BEGIN
    INSERT INTO `candidates-stats`(date, numberOfNewCandidates) VALUES (DATE(NOW()),0)
    ON DUPLICATE KEY UPDATE date = VALUES(date);

    IF NEW.role = 'CANDIDATE'
      THEN
        UPDATE `candidates-stats`
        SET numberOfNewCandidates = numberOfNewCandidates + 1
        WHERE `candidates-stats`.date = DATE(NOW());
    END IF;
  END;