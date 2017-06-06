DROP VIEW IF EXISTS wcm_ingredient;
CREATE VIEW wcm_ingredient(ingredient_id, ingredient_name, supplier) AS
  SELECT ingredient.ingredient_id,
    ingredient.ingredient_name,
	ingredient.supplier
  FROM ingredient
  ORDER BY ingredient_id;