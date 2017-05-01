DROP VIEW IF EXISTS view_recipe;

CREATE VIEW view_recipe(recipe_id, recipe_name) AS
  SELECT recipe.recipe_id,
    recipe.recipe_name
  FROM recipe
  ORDER BY recipe_name;