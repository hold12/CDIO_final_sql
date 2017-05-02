DROP VIEW IF EXISTS pharm_ingredientbatch;
CREATE VIEW pharm_ingredientbatch(ingredient_name, supplier, amount) AS
  SELECT ingredient.ingredient_name,
    ingredient.supplier,
    SUM(ingredientbatch.amount)
  FROM ingredientbatch
  JOIN ingredient
    ON ingredient.ingredient_id = ingredientbatch.ingredient_id
  GROUP BY ingredient_name,supplier
  ORDER BY ingredient_name, supplier;
