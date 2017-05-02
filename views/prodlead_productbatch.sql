DROP VIEW IF EXISTS prodlead_productbatch;
CREATE VIEW prodlead_productbatch(id, recipe_name, status) AS
  SELECT productbatch_id,
    recipe_name,
    status
  FROM productbatch
  JOIN recipe
    ON recipe.recipe_id = productbatch.recipe_id
  ORDER BY recipe_name, status;