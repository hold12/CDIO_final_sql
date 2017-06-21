DROP VIEW IF EXISTS pharm_recipe;
CREATE VIEW pharm_recipe(recipe_id, recipe_name) AS
  SELECT recipe.recipe_id,
    recipe.recipe_name
  FROM recipe
  ORDER BY recipe.recipe_id;
