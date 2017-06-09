DROP VIEW IF EXISTS wcm_ingredient;
CREATE VIEW wcm_ingredient(ingredient_id, ingredient_name) AS
  SELECT ingredient.ingredient_id,
    ingredient.ingredient_name
  FROM ingredient
  ORDER BY ingredient_id;