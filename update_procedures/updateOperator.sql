DROP PROCEDURE IF EXISTS updateOperator;
DELIMITER //
CREATE PROCEDURE updateOperator(
  IN id         INT(11),
  IN first_name TEXT,
  IN last_name  TEXT,
  IN initials   TEXT,
  IN cpr        TEXT,
  IN password   TEXT,
  IN is_active	BIT
)
  BEGIN
    SET @operator_id = id;
    SET @firstname = first_name;
    SET @lastname = last_name;
    SET @ini = initials;
    SET @cpr_v = cpr;
    SET @password_v = password;
    SET @is_active_v = is_active;
    SET @s = 'UPDATE operator
      SET operator_firstname = ?
      , operator_lastname = ?
      , initials = ?
      , cpr = ?
      , password = ?
      , is_active = ?
      WHERE operator_id = ?';
	
	PREPARE statement FROM @s;
	EXECUTE statement USING @firstname, @lastname, @ini, @cpr_v, @password_v, @is_active_v, @operator_id;
	DEALLOCATE PREPARE statement;
  END//
DELIMITER ;