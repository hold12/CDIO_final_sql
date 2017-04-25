USE dbweight;

DROP PROCEDURE IF EXISTS updateProductbatch;

DELIMITER //

CREATE PROCEDURE updateProductbatch(
  IN id        INT(11),
  IN status    INT(11),
  IN recipe_id INT(11)
)
  BEGIN
    SET @s = CONCAT('
      UPDATE productbatch
      SET status = ', status, '
        , recipe_id = ', recipe_id, '
      WHERE productbatch_id = ', id, ';');
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;