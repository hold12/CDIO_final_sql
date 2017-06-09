DROP VIEW IF EXISTS web_recipe;
CREATE VIEW web_recipe(recipe_id, recipe_name) AS
  SELECT recipe_id, 
	recipe_name
  FROM recipe
  ORDER BY recipe_id;