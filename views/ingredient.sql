DROP VIEW IF EXISTS view_ingredient;
CREATE VIEW view_ingredient(ingredient_id,ingredient_name, supplier) AS
  SELECT ingredient_id,
    ingredient_name,
    supplier
  FROM ingredient
  ORDER BY ingredient_name,supplier;