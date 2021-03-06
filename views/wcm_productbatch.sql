DROP VIEW IF EXISTS wcm_productbatch;
CREATE VIEW wcm_productbatch(productbatch_id, created_time, finished_time, status, recipe_id, user_id) AS
  SELECT productbatch_id,
    created_time,
	finished_time, 
	status, 
	recipe_id, 
	user_id
  FROM productbatch
  ORDER BY productbatch_id;