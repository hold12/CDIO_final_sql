DROP VIEW IF EXISTS wcm_recipecomponent;
CREATE VIEW wcm_recipecomponent(recipe_id, ingredient_id, nominated_net_weight, tolerance) AS
  SELECT recipe_id, 
	ingredient_id, 
	nominated_net_weight, 
	tolerance
  FROM recipecomponent
  ORDER BY recipe_id, ingredient_id;