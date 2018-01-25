DROP TRIGGER IF EXISTS addCandidateDetails;
CREATE TRIGGER addCandidateDetails
AFTER INSERT ON users
FOR EACH ROW
  BEGIN
    INSERT INTO candidate_details(user_id, party_shortcut) VALUES(NEW.user_id, 'default');
  END;