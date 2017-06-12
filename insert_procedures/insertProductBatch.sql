
DROP PROCEDURE IF EXISTS insertProductbatch;
DELIMITER //
CREATE PROCEDURE insertProductbatch(
  IN created_time TIMESTAMP,
  IN recipe_id    INT(11),
  IN user_id      INT(11)
)
  BEGIN

    SET @productbatch_id_v = (SELECT IFNULL(MAX(productbatch_id), 0) + 1
                              FROM productbatch);
    SET @created_time_v = created_time;
    SET @finished_time_v = NULL;
    SET @status_v = 0;
    SET @recipe_id_v = recipe_id;
    SET @user_id_v = user_id;
    SET @s = 'INSERT INTO productbatch(productbatch_id, created_time, finished_time, status, recipe_id, user_id) VALUES(?,?,?,?,?,?);';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @productbatch_id_v, @created_time_v, @finished_time_v, @status_v, @recipe_id_v, @user_id_v;
    DEALLOCATE PREPARE statement;

    SELECT @productbatch_id_v AS productbatch_id;
  END//
DELIMITER ;