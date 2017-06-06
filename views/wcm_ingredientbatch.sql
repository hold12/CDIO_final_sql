DROP VIEW IF EXISTS wcm_ingredientbatch;
CREATE VIEW wcm_ingredientbatch(ingredientbatch_id, ingredient_id, amount) AS
  SELECT ingredientbatch_id, 
	ingredient_id, 
	amount
  FROM ingredientbatch
  ORDER BY ingredientbatch_id;