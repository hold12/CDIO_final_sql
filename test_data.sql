DELETE FROM productbatchcomponent;
DELETE FROM productbatch;
DELETE FROM recipecomponent;
DELETE FROM recipe;
DELETE FROM ingredientbatch;
DELETE FROM ingredient;
DELETE FROM user_role;
DELETE FROM role_permission;
DELETE FROM permission;
DELETE FROM role;
DELETE FROM user;

INSERT INTO user(user_id, firstname, lastname, initials, password, is_active) VALUES
  (1, 'admin', NULL, 'adm', 'root', 1),
  (2, 'Antonella', 'B', 'AB', 'atoJ21v', 1),
  (3, 'Luigi', 'C', 'LC', 'jEfm5aQ', 0),
  (4, 'Bob', 'D', 'BD', 'h3jE7Ol', 1);

INSERT INTO role(role_id,role_name) VALUES
  (1, 'administrator'),
  (2, 'pharmacist'),
  (3, 'foreman'),
  (4, 'labtech');

INSERT INTO permission(permission_id, permission_name) VALUES
  (1, 'user.create'),
  (2, 'user.update'),
  (3, 'user.delete'),
  (4, 'user.read'),
  (5, 'ingredient.create'),
  (6, 'ingredient.read'),
  (7, 'recipe.create'),
  (8, 'recipe.read'),
  (9, 'ingredientbatch.create'),
  (10, 'ingredientbatch.read'),
  (11, 'productbatch.create'),
  (12, 'productbatch.read'),
  (13, 'weighing');

INSERT INTO user_role(user_id,role_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4);

INSERT INTO role_permission(role_id, permission_id) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (2, 5),
  (2, 6),
  (2, 7),
  (2, 8),
  (3, 9),
  (3, 10),
  (3, 11),
  (3, 12),
  (4, 13);

INSERT INTO ingredient(ingredient_id, ingredient_name, supplier) VALUES
  (1, 'Freyas OnePlus X', 'OnePlus'),
  (2, 'Troels OnePlus 3T', 'OnePlus'),
  (3, 'Sebastians iPhone SE', 'Apple'),
  (4, 'Anders iPhone 6S', 'Apple'),
  (5, 'Christoffers Huawei P9 Lite', 'Huawei');

INSERT INTO ingredientbatch(ingredientbatch_id, ingredient_id, amount) VALUES
  (1, 1, 100),
  (2, 2, 100),
  (3, 3, 100),
  (4, 4, 100),
  (5, 5, 100);

INSERT INTO recipe(recipe_id, recipe_name) VALUES
  (1, 'OnePlus-kage'),
  (2, 'Applepie'),
  (3, 'Huawei-wok');

INSERT INTO recipecomponent(recipe_id, ingredient_id, nominated_net_weight, tolerance) VALUES
  (1, 1, 0.142, 1),
  (1, 2, 0.25, 1),

  (2, 3, 0.174, 1),
  (2, 4, 0.128, 1),

  (3, 5, 0.144, 1);

INSERT INTO productbatch(productbatch_id, created_time, finished_time, recipe_id, status, user_id) VALUES
  (1, '2017-06-04 10:38:39', NULL, 1, 0, 4),
  (2, '2017-06-05 11:39:26', NULL, 2, 0, 4),
  (3, '2017-06-06 11:39:26', NULL, 3, 0, 4);
