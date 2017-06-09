DROP VIEW IF EXISTS web_ingredient;
CREATE VIEW web_ingredient(ingredient_id, ingredient_name, supplier) AS
  SELECT ingredient.ingredient_id,
    ingredient.ingredient_name,
	ingredient.supplier
  FROM ingredient
  ORDER BY ingredient_id;