DROP VIEW IF EXISTS foreman_productbatchcomponent;
CREATE VIEW foreman_productbatchcomponent(productbatch_id, created_time, finished_time, status, recipe_id, recipe_name, user_id, firstname, lastname, ingredient_id, ingredient_name, nominated_net_weight, tolerance, tare, net_weight, ingredientbatch_id) AS
  SELECT
    productbatch.productbatch_id,
    productbatch.created_time,
    productbatch.finished_time,
    productbatch.status,
    recipe.recipe_id,
    recipe.recipe_name,
    user.user_id,
    user.firstname,
    user.lastname,
    ingredient.ingredient_id,
    ingredient.ingredient_name,
    recipecomponent.nominated_net_weight,
    recipecomponent.tolerance,
    productbatchcomponent.tare,
    productbatchcomponent.net_weight,
    productbatchcomponent.ingredientbatch_id
  FROM productbatch
    JOIN recipe
      ON productbatch.recipe_id = recipe.recipe_id
    JOIN user
      ON productbatch.user_id = user.user_id
    JOIN recipecomponent
      ON recipe.recipe_id = recipecomponent.recipe_id
    JOIN ingredient
      ON recipecomponent.ingredient_id = ingredient.ingredient_id
    LEFT JOIN productbatchcomponent
      ON productbatch.productbatch_id = productbatchcomponent.productbatch_id;
