DROP VIEW IF EXISTS prodlead_productbatch;
CREATE VIEW prodlead_productbatch(productbatch_id, recipe_id, recipe_name, created_time, finished_time, status, user_id, user_initials) AS
  SELECT productbatch.productbatch_id,
    recipe.recipe_id,
    recipe.recipe_name,
    productbatch.created_time,
    productbatch.finished_time,
    productbatch.status,
    productbatch.user_id,
    user.initials
  FROM productbatch
  JOIN recipe
    ON recipe.recipe_id = productbatch.recipe_id
  JOIN user
    ON user.user_id = productbatch.user_id
  ORDER BY created_time;