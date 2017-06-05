DROP VIEW IF EXISTS pharm_ingredient;
CREATE VIEW pharm_ingredient(ingredient_id,ingredient_name, supplier) AS
  SELECT ingredient_id,
    ingredient_name,
    supplier
  FROM ingredient
  ORDER BY ingredient_name,supplier;