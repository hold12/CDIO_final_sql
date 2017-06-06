DROP VIEW IF EXISTS wcm_recipe;
CREATE VIEW wcm_recipe(recipe_id, recipe_name) AS
  SELECT recipe_id, 
	recipe_name
  FROM recipe
  ORDER BY recipe_id;