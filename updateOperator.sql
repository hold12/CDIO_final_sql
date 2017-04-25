USE dbweight;

DROP PROCEDURE IF EXISTS updateOperator;

DELIMITER //

CREATE PROCEDURE updateOperator(
  IN id         INT(11),
  IN first_name TEXT,
  IN last_name  TEXT,
  IN initials   TEXT,
  IN cpr        TEXT,
  IN password   TEXT
)
  BEGIN

    SET @s = CONCAT('
      UPDATE operator
      SET operator_firstname = ''', first_name, '''
        , operator_lastname = ''', last_name, '''
        , initials = ''', initials, '''
        , cpr = ''', cpr, '''
        , password = ''', password, '''
      WHERE operator_id = ', id, ';');
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;