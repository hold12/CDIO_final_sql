DROP VIEW IF EXISTS foreman_productbatchcomponent;
CREATE VIEW foreman_productbatchcomponent(productbatch_id, ingredientbatch_id, ingredient_id, ingredient_name, supplier, tare, net_weight) AS
  SELECT productbatchcomponent.productbatch_id,
    productbatchcomponent.ingredientbatch_id,
    ingredient.ingredient_id,
    ingredient.ingredient_name,
    ingredient.supplier,
    productbatchcomponent.tare,
    productbatchcomponent.net_weight
  FROM productbatchcomponent
    JOIN ingredientbatch
      ON productbatchcomponent.ingredientbatch_id = ingredientbatch.ingredientbatch_id
    JOIN ingredient
      ON ingredientbatch.ingredient_id = ingredient.ingredient_id;