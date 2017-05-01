DROP VIEW IF EXISTS view_recipe;

CREATE VIEW view_recipe(id, recipe_name, ingredient_name, supplier, nominated_net_weight, tolerance) AS
  SELECT recipe.recipe_id,
    recipe.recipe_name,
    ingredient.ingredient_name,
    ingredient.supplier,
    recipecomponent.nominated_net_weight,
    recipecomponent.tolerance
  FROM recipe
  JOIN recipecomponent
    ON recipe.recipe_id = recipecomponent.recipe_id
  JOIN ingredient
    ON recipecomponent.ingredient_id = ingredient.ingredient_id
  ORDER BY recipe_name,ingredient_name;