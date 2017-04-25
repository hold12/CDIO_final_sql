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
               FROM operator),0);
    SET @s = CONCAT(
        'INSERT INTO operator(operator_id, operator_firstname, operator_lastname, initials, cpr, password) VALUES(
        ', @id + 1, ',''', firstname, ''',''', lastname, ''',''', initials, ''',''', cpr, ''',''', password, ''');'
    );
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;