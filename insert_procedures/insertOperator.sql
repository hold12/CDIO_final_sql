USE dbweight;

DROP PROCEDURE IF EXISTS insertOperator;

DELIMITER //

CREATE PROCEDURE insertOperator(
  IN firstname TEXT,
  IN lastname  TEXT,
  IN initials  TEXT,
  IN cpr       TEXT,
  IN password  TEXT
)
  BEGIN
    SET @id = IFNULL((SELECT MAX(operator_id)
               FROM operator),0)+1;
    SET @firstname_v = firstname;
    SET @lastname_v = lastname;
    SET @initials_v = initials;
    SET @cpr_v = cpr;
    SET @password_v = password;
    SET @s = 'INSERT INTO operator(operator_id, operator_firstname, operator_lastname, initials, cpr, password) VALUES(?,?,?,?,?,?);';
    PREPARE statement FROM @s;
    EXECUTE statement USING @id, @firstname_v, @lastname_v, @initials_v, @cpr_v, @password_v;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;