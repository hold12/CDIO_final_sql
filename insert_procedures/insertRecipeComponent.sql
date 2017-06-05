DROP PROCEDURE IF EXISTS insertRecipecomponent;
DELIMITER //
CREATE PROCEDURE insertRecipecomponent(
  IN recipe_id            INT(11),
  IN ingredient_id        INT(11),
  IN nominated_net_weight DOUBLE,
  IN tolerance            DOUBLE
)
  BEGIN
    SET @recipe_id_v = recipe_id;
    SET @ingredient_id_v = ingredient_id;
    SET @nominated_net_weight_v = nominated_net_weight;
    SET @tolerance_v = tolerance;
    SET @s = 'INSERT INTO recipecomponent(recipe_id, ingredient_id, nominated_net_weight, tolerance) VALUES(?,?,?,?);';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @recipe_id_v, @ingredient_id_v, @nominated_net_weight_v, @tolerance_v;
    DEALLOCATE PREPARE statement;
  END//
DELIMITER ;