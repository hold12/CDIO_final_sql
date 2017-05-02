DROP VIEW IF EXISTS view_ingredientbatch;
CREATE VIEW view_ingredientbatch(ingredientbatch_id,ingredient_id, amount) AS
  SELECT ingredientbatch_id,
    ingredient_id,
    amount
  FROM ingredientbatch
  ORDER BY ingredientbatch_id,ingredient_id;