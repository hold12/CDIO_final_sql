DROP VIEW IF EXISTS pharm_recipe;
CREATE VIEW pharm_recipe(id, recipe_name, ingredient_id, ingredient_name, supplier, nominated_net_weight, tolerance) AS
  SELECT recipe.recipe_id,
    recipe.recipe_name,
    ingredient.ingredient_id,
    ingredient.ingredient_name,
    ingredient.supplier,
    recipecomponent.nominated_net_weight,
    recipecomponent.tolerance
  FROM recipe
  JOIN recipecomponent
    ON recipe.recipe_id = recipecomponent.recipe_id
  JOIN ingredient
    ON recipecomponent.ingredient_id = ingredient.ingredient_id
  ORDER BY recipe_name,nominated_net_weight DESC,ingredient_name;