DROP VIEW IF EXISTS web_productbatchcomponent;
CREATE VIEW web_productbatchcomponent(productbatch_id, ingredientbatch_id, tare, net_weight) AS
  SELECT productbatch_id, 
	ingredientbatch_id, 
	tare, 
	net_weight
  FROM productbatchcomponent
  ORDER BY productbatch_id, ingredientbatch_id;