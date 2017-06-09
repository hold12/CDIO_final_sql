DROP VIEW IF EXISTS web_ingredientbatch;
CREATE VIEW web_ingredientbatch(ingredientbatch_id, ingredient_id, amount) AS
  SELECT ingredientbatch_id, 
	ingredient_id, 
	amount
  FROM ingredientbatch
  ORDER BY ingredientbatch_id;