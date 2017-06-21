DROP VIEW IF EXISTS foreman_productbatch;
CREATE VIEW foreman_productbatch(productbatch_id, recipe_id, recipe_name, created_time, finished_time, status, user_id, initials) AS
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
  ORDER BY productbatch.productbatch_id;
