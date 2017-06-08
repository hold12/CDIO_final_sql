DROP PROCEDURE IF EXISTS updateProductbatch;
DELIMITER //
CREATE PROCEDURE updateProductbatch(
  IN id        INT(11),
  IN status    INT(11),
  IN recipe_id INT(11),
  IN user_id   INT(11)
)
  BEGIN
    SET @productbatch_id = id;
    SET @status_v = status;
    SET @recipe_id_v = recipe_id;
    SET @user_id_v = user_id;
    SET @s = 'UPDATE productbatch
      SET status = ?
        , recipe_id = ?
        , user_id = ?
      WHERE productbatch_id = ?';

    PREPARE statement FROM @s;
    EXECUTE statement USING @status_v, @recipe_id_v, @user_id_v, @productbatch_id;
    DEALLOCATE PREPARE statement;
  END//
DELIMITER ;