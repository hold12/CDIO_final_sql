DROP VIEW IF EXISTS prodlead_productbatchcounter;
CREATE VIEW prodlead_productbatchcounter (recipe_name, status, counter) AS
  SELECT recipe_name,
    status,
    COUNT(*)
  FROM productbatch
  JOIN recipe
    ON recipe.recipe_id = productbatch.recipe_id
  GROUP BY recipe_name,status
  ORDER BY recipe_name, status;