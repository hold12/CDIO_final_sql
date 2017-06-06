DROP VIEW IF EXISTS wcm_productbatchcomponent;
CREATE VIEW wcm_productbatchcomponent(productbatch_id, ingredientbatch_id, tare, net_weight) AS
  SELECT productbatch_id, 
	ingredientbatch_id, 
	tare, 
	net_weight
  FROM productbatchcomponent
  ORDER BY productbatch_id, ingredientbatch_id;