DROP VIEW IF EXISTS web_recipecomponent;
CREATE VIEW web_recipecomponent(recipe_id, ingredient_id, nominated_net_weight, tolerance) AS
  SELECT recipe_id, 
	ingredient_id, 
	nominated_net_weight, 
	tolerance
  FROM recipecomponent
  ORDER BY recipe_id, ingredient_id;