DROP PROCEDURE IF EXISTS new_user;
CREATE PROCEDURE `new_user` ()
  BEGIN
    INSERT INTO users (role) VALUES ( 'USER');
  END