DROP VIEW IF EXISTS view_productbatch;

CREATE VIEW view_productbatch(id, status, recipe_id) AS
  SELECT productbatch_id,
    status,
    recipe_id
  FROM productbatch
  ORDER BY productbatch_id,status;