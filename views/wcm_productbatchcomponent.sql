DROP VIEW IF EXISTS wcm_productbatchcomponent;
CREATE VIEW wcm_productbatchcomponent(productbatch_id, user_id, firstname, lastname, recipe_name, ingredientbatch_id, ingredient_name, nominated_net_weight, tolerance, amount) AS
  SELECT productbatch.productbatch_id,
    user.user_id,
	user.firstname,
	user.lastname,
    recipe.recipe_name,
	ingredientbatch.ingredientbatch_id,
    ingredient.ingredient_name,
	recipecomponent.nominated_net_weight,
	recipecomponent.tolerance,
	ingredientbatch.amount
  FROM productbatch
  JOIN productbatchcomponent
    ON productbatch.productbatch_id = productbatchcomponent.productbatch_id
  JOIN recipe
    ON productbatch.recipe_id = recipe.recipe_id
  JOIN ingredientbatch
    ON productbatchcomponent.ingredientbatch_id = ingredientbatch.ingredientbatch_id
  JOIN ingredient
    ON ingredientbatch.ingredient_id = ingredient.ingredient_id
  JOIN user
    ON productbatch.user_id = user.user_id
  JOIN recipecomponent
	ON recipe.recipe_id = recipecomponent.recipe_id
	AND ingredient.ingredient_id = recipecomponent.ingredient_id
  ORDER BY recipe.recipe_name,productbatch_id, ingredient_name;