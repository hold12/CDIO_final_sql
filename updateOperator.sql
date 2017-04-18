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
    IF first_name != ''
    THEN
      BEGIN
        SET @s = CONCAT('
          UPDATE operator
          SET operator_firstname = ''', first_name, '''
          WHERE operator_id = ''', id, ''';
        ');
        PREPARE statement FROM @s;
        EXECUTE statement;
        DEALLOCATE PREPARE statement;
      END;
    END IF;

    IF last_name != ''
    THEN
      BEGIN
        SET @s = CONCAT('
          UPDATE operator
          SET operator_lastname = ''', last_name, '''
          WHERE operator_id = ''', id, ''';
        ');
        PREPARE statement FROM @s;
        EXECUTE statement;
        DEALLOCATE PREPARE statement;
      END;
    END IF;

    IF initials != ''
    THEN
      BEGIN
        SET @s = CONCAT('
          UPDATE operator
          SET initials = ''', initials, '''
          WHERE operator_id = ''', id, ''';
        ');
        PREPARE statement FROM @s;
        EXECUTE statement;
        DEALLOCATE PREPARE statement;
      END;
    END IF;

    IF cpr != ''
    THEN
      BEGIN
        SET @s = CONCAT('
          UPDATE operator
          SET cpr = ''', cpr, '''
          WHERE operator_id = ''', id, ''';
        ');
        PREPARE statement FROM @s;
        EXECUTE statement;
        DEALLOCATE PREPARE statement;
      END;
    END IF;

    IF password != ''
    THEN
      BEGIN
        SET @s = CONCAT('
          UPDATE operator
          SET password = ''', password, '''
          WHERE operator_id = ''', id, ''';
        ');
        PREPARE statement FROM @s;
        EXECUTE statement;
        DEALLOCATE PREPARE statement;
      END;
    END IF;

  END//

DELIMITER ;
