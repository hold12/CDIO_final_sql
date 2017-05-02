DROP VIEW IF EXISTS view_productbatchcomponent;
CREATE VIEW view_productbatchcomponent(productbatch_id, ingredientbatch_id, tare,net_weight,operator_id) AS
  SELECT productbatch_id,
    ingredientbatch_id,
    tare,
    net_weight,
    operator_id
  FROM productbatchcomponent
  ORDER BY productbatch_id,ingredientbatch_id;