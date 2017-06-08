DROP PROCEDURE IF EXISTS updateProductbatch;
DELIMITER //
CREATE PROCEDURE updateProductbatch(
  IN productbatch_id INT(11),
  IN created_time    TIMESTAMP,
  IN finished_time   TIMESTAMP,
  IN status          INT(11),
  IN recipe_id       INT(11),
  IN user_id         INT(11)
)
  BEGIN
    SET @productbatch_id_v = productbatch_id;
    SET @created_time_v = created_time;
    SET @finished_time_v = finished_time;
    SET @status_v = status;
    SET @recipe_id_v = recipe_id;
    SET @user_id_v = user_id;
    SET @s = 'UPDATE productbatch
      SET created_time = ?
		    , finished_time = ?
		    , status = ?
        , recipe_id = ?
        , user_id = ?
      WHERE productbatch_id = ?';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @created_time_v, @finished_time_v, @status_v, @recipe_id_v, @user_id_v, @productbatch_id_v;
    DEALLOCATE PREPARE statement;
  END//
DELIMITER ;