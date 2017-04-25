USE dbweight;

DROP PROCEDURE IF EXISTS insertRecipecomponent;

DELIMITER //

CREATE PROCEDURE insertRecipecomponent(
  IN recipe_id            INT(11),
  IN ingredient_id        INT(11),
  IN nominated_net_weight DOUBLE,
  IN tolerance            DOUBLE
)
  BEGIN
    SET @s = CONCAT(
        'INSERT INTO recipecomponent(recipe_id, ingredient_id, nominated_net_weight, tolerance) VALUES(
        ', recipe_id, ',', ingredient_id, ',', nominated_net_weight, ',', tolerance, ');'
    );
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;