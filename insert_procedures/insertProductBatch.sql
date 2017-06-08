DROP PROCEDURE IF EXISTS insertProductbatch;
DELIMITER //
CREATE PROCEDURE insertProductbatch(
  IN status          INT(11),
  IN recipe_id       INT(11),
  IN user_id         INT(11)
)
  BEGIN
    SET @productbatch_id_v = (SELECT IFNULL(MAX(productbatch_id),0)+1 FROM productbatch);
    SET @status_v = status;
    SET @recipe_id_v = recipe_id;
    SET @user_id_v = user_id;
    SET @s = 'INSERT INTO productbatch(productbatch_id, status, recipe_id, user_id) VALUES(?,?,?,?);';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @productbatch_id_v, @status_v, @recipe_id_v, @user_id_v;
    DEALLOCATE PREPARE statement;

    SELECT @productbatch_id_v AS productbatch_id;
  END//
DELIMITER ;