DROP VIEW IF EXISTS foreman_ingredientbatch;
CREATE VIEW foreman_ingredientbatch(ingredientbatch_id, ingredient_name, supplier, amount) AS
  SELECT ingredientbatch.ingredientbatch_id,
	ingredient.ingredient_name,
    ingredient.supplier,
	ingredientbatch.amount
  FROM ingredientbatch
  JOIN ingredient
    ON ingredient.ingredient_id = ingredientbatch.ingredient_id
ORDER BY ingredient_name, supplier;