DROP PROCEDURE IF EXISTS deleteJohnDoes;
DELIMITER //
CREATE PROCEDURE deleteJohnDoes()
BEGIN
  DELETE FROM user_role
  WHERE user_id IN (SELECT user_id FROM user WHERE firstname="John" AND lastname="Doe");
  DELETE FROM user WHERE firstname="John" AND lastname="Doe";
END//
DELIMITER ;
