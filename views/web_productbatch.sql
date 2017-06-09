DROP VIEW IF EXISTS web_productbatch;
CREATE VIEW web_productbatch(productbatch_id, created_time, finished_time, status, recipe_id, user_id) AS
  SELECT productbatch_id, 
	created_time, 
	finished_time, 
	status, 
	recipe_id, 
	user_id
  FROM productbatch
  ORDER BY productbatch_id;