DROP VIEW IF EXISTS adm_operator;
CREATE VIEW adm_operator(id, first_name, last_name,initials,cpr) AS
  SELECT operator_id,
    operator_firstname,
    operator_lastname,
    initials,
    cpr
  FROM dbweight.operator
  ORDER BY operator_firstname, operator_lastname;

DROP VIEW IF EXISTS view_ingredient;
CREATE VIEW view_ingredient(ingredient_id,ingredient_name, supplier) AS
  SELECT ingredient_id,
    ingredient_name,
    supplier
  FROM ingredient
  ORDER BY ingredient_name,supplier;

DROP VIEW IF EXISTS view_ingredientbatch;
CREATE VIEW view_ingredientbatch(ingredientbatch_id,ingredient_id, amount) AS
  SELECT ingredientbatch_id,
    ingredient_id,
    amount
  FROM ingredientbatch
  ORDER BY ingredientbatch_id,ingredient_id;

DROP VIEW IF EXISTS labtech_productbatchcomponent;
CREATE VIEW labtech_productbatchcomponent(productbatch_id, recipe_name, ingredient_name,status,tare,net_weight,operator_id) AS
  SELECT productbatch.productbatch_id,
    recipe.recipe_name,
    ingredient.ingredient_name,
    productbatch.status,
    productbatchcomponent.tare,
    productbatchcomponent.net_weight,
    operator.operator_id
  FROM productbatch
  JOIN productbatchcomponent
    ON productbatch.productbatch_id = productbatchcomponent.productbatch_id
  JOIN recipe
    ON productbatch.recipe_id = recipe.recipe_id
  JOIN ingredientbatch
    ON productbatchcomponent.ingredientbatch_id = ingredientbatch.ingredientbatch_id
  JOIN ingredient
    ON ingredientbatch.ingredient_id = ingredient.ingredient_id
  JOIN operator
    ON productbatchcomponent.operator_id = operator.operator_id
  ORDER BY recipe.recipe_name,productbatch_id, ingredient_name;

DROP VIEW IF EXISTS labtech_recipe;
CREATE VIEW labtech_recipe(id, recipe_name, ingredient_name, supplier, nominated_net_weight, tolerance) AS
  SELECT recipe.recipe_id,
    recipe.recipe_name,
    ingredient.ingredient_name,
    ingredient.supplier,
    recipecomponent.nominated_net_weight,
    recipecomponent.tolerance
  FROM recipe
  JOIN recipecomponent
    ON recipe.recipe_id = recipecomponent.recipe_id
  JOIN ingredient
    ON recipecomponent.ingredient_id = ingredient.ingredient_id
  ORDER BY recipe_name,ingredient_name;

DROP VIEW IF EXISTS view_operator;
CREATE VIEW view_operator(operator_id, operator_firstname, operator_lastname,initials,cpr,password, is_active) AS
  SELECT operator_id,
    operator_firstname,
    operator_lastname,
    initials,
    cpr,
    password,
    is_active
  FROM operator
  ORDER BY operator_firstname, operator_lastname;

DROP VIEW IF EXISTS pharm_ingredientbatch;
CREATE VIEW pharm_ingredientbatch(ingredient_name, supplier, amount) AS
  SELECT ingredient.ingredient_name,
    ingredient.supplier,
    SUM(ingredientbatch.amount)
  FROM ingredientbatch
  JOIN ingredient
    ON ingredient.ingredient_id = ingredientbatch.ingredient_id
  GROUP BY ingredient_name,supplier
  ORDER BY ingredient_name, supplier;

DROP VIEW IF EXISTS prodlead_productbatch;
CREATE VIEW prodlead_productbatch(id, recipe_name, status) AS
  SELECT productbatch_id,
    recipe_name,
    status
  FROM productbatch
  JOIN recipe
    ON recipe.recipe_id = productbatch.recipe_id
  ORDER BY recipe_name, status;

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

DROP VIEW IF EXISTS view_productbatch;
CREATE VIEW view_productbatch(productbatch_id, status, recipe_id) AS
  SELECT productbatch_id,
    status,
    recipe_id
  FROM productbatch
  ORDER BY productbatch_id,status;

DROP VIEW IF EXISTS view_productbatchcomponent;
CREATE VIEW view_productbatchcomponent(productbatch_id, ingredientbatch_id, tare,net_weight,operator_id) AS
  SELECT productbatch_id,
    ingredientbatch_id,
    tare,
    net_weight,
    operator_id
  FROM productbatchcomponent
  ORDER BY productbatch_id,ingredientbatch_id;

DROP VIEW IF EXISTS view_recipe;
CREATE VIEW view_recipe(recipe_id, recipe_name) AS
  SELECT recipe.recipe_id,
    recipe.recipe_name
  FROM recipe
  ORDER BY recipe_name;

DROP VIEW IF EXISTS view_recipecomponent;
CREATE VIEW view_recipecomponent(recipe_id, ingredient_id, nominated_net_weight, tolerance) AS
  SELECT recipe_id,
    ingredient_id,
    nominated_net_weight,
    tolerance
  FROM recipecomponent
  ORDER BY recipe_id,ingredient_id;
