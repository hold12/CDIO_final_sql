DROP VIEW IF EXISTS labtech_productbatchcomponent;
CREATE VIEW labtech_productbatchcomponent(productbatch_id, recipe_name, ingredient_name,status,tare,net_weight,operator_id) AS
  SELECT productbatch.productbatch_id,
    recipe.recipe_name,
    ingredient.ingredient_name,
    productbatch.status,
    productbatchcomponent.tare,
    productbatchcomponent.net_weight,
    operator.operator_id
  FROM productbatch
  JOIN productbatchcomponent
    ON productbatch.productbatch_id = productbatchcomponent.productbatch_id
  JOIN recipe
    ON productbatch.recipe_id = recipe.recipe_id
  JOIN ingredientbatch
    ON productbatchcomponent.ingredientbatch_id = ingredientbatch.ingredientbatch_id
  JOIN ingredient
    ON ingredientbatch.ingredient_id = ingredient.ingredient_id
  JOIN operator
    ON productbatchcomponent.operator_id = operator.operator_id
  ORDER BY recipe.recipe_name,productbatch_id, ingredient_name;