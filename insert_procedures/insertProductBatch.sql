USE dbweight;

DROP PROCEDURE IF EXISTS insertProductbatch;

DELIMITER //

CREATE PROCEDURE insertProductbatch(
  IN status    INT(11),
  IN recipe_id INT(11)
)
  BEGIN
    SET @id = (SELECT MAX(productbatch_id)
               FROM productbatch);
    SET @s = CONCAT(
        'INSERT INTO productbatch(productbatch_id, status, recipe_id) VALUES(
        ', @id + 1, ',', status, ',', recipe_id, ');'
    );
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;