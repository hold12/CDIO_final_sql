DROP PROCEDURE IF EXISTS insertProductbatch;
DELIMITER //
CREATE PROCEDURE insertProductbatch(
  IN status    INT(11),
  IN recipe_id INT(11)
)
  BEGIN
    SET @id = IFNULL((SELECT MAX(productbatch_id)
               FROM productbatch),0)+1;
    SET @status_v = status;
    SET @recipe_id_v = recipe_id;
    SET @s = 'INSERT INTO productbatch(productbatch_id, status, recipe_id) VALUES(?,?,?);';
    
	PREPARE statement FROM @s;
    EXECUTE statement USING @id, @status_v, @recipe_id_v;
    DEALLOCATE PREPARE statement;
  END//
DELIMITER ;