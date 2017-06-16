DROP VIEW IF EXISTS pharm_recipecomponent;
CREATE VIEW pharm_recipecomponent(recipe_id, ingredient_id, ingredient_name, supplier, nominated_net_weight, tolerance) AS
  SELECT recipecomponent.recipe_id,
    ingredient.ingredient_id,
    ingredient.ingredient_name,
    ingredient.supplier,
    recipecomponent.nominated_net_weight,
    recipecomponent.tolerance
  FROM recipecomponent
    JOIN ingredient
      ON recipecomponent.ingredient_id = ingredient.ingredient_id
  ORDER BY nominated_net_weight DESC,ingredient_name;