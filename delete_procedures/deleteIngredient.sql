USE dbweight;

DROP PROCEDURE IF EXISTS deleteIngredient;

DELIMITER //

CREATE PROCEDURE deleteIngredient (
  IN id INT(11)
)
BEGIN
  SET @ingredient_id = id;
  SET @s = 'DELETE FROM ingredient
  WHERE ingredient_id = ?;';

  PREPARE statement FROM @s;
  EXECUTE statement USING @ingredient_id;
  DEALLOCATE PREPARE statement;

END//

DELIMITER ;
