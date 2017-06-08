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
  (3, 'Luigi', 'C', 'LC', 'jEfm5aQ', 1);

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
  (3, 4);

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
  (1, 'dej', 'Wawelka'),
  (2, 'tomat', 'Knoor'),
  (3, 'tomat', 'Veaubais'),
  (4, 'tomat', 'Franz'),
  (5, 'ost', 'Ost og Skinke A/S'),
  (6, 'skinke', 'Ost og Skinke A/S'),
  (7, 'champignon', 'Igloo Frostvarer');

INSERT INTO ingredientbatch(ingredientbatch_id, ingredient_id, amount) VALUES
  (1, 1, 1000),
  (2, 2, 300),
  (3, 3, 300),
  (4, 5, 100),
  (5, 5, 100),
  (6, 6, 100),
  (7, 7, 100),
  (8, 4, 100);

INSERT INTO recipe(recipe_id, recipe_name) VALUES
  (1, 'margherita'),
  (2, 'prosciutto'),
  (3, 'capricciosa');

INSERT INTO recipecomponent(recipe_id, ingredient_id, nominated_net_weight, tolerance) VALUES
  (1, 1, 10.0, 0.1),
  (1, 2, 2.0, 0.1),
  (1, 5, 2.0, 0.1),

  (2, 1, 10.0, 0.1),
  (2, 3, 2.0, 0.1),
  (2, 5, 1.5, 0.1),
  (2, 6, 1.5, 0.1),

  (3, 1, 5.0, 0.1),
  (3, 4, 1.5, 0.1),
  (3, 5, 1.5, 0.1),
  (3, 6, 1.0, 0.1),
  (3, 7, 1.0, 0.1);

INSERT INTO productbatch(productbatch_id, created_time, finished_time, recipe_id, status, user_id) VALUES
  (1, '2017-02-10 14:30:20', '2017-02-10 14:45:38', 1, 2, 1),
  (2, '2017-03-03 08:02:32', '2017-03-03 08:07:06', 1, 2, 2),
  (3, '2017-04-30 09:40:00', '2017-04-30 10:03:27', 2, 2, 2),
  (4, '2017-05-18 10:38:39', NULL, 3, 1, 3),
  (5, '2017-05-30 11:39:26', NULL, 3, 0, 1);

INSERT INTO productbatchcomponent(productbatch_id, ingredientbatch_id, tare, net_weight) VALUES
  (1, 1, 0.5, 10.05),
  (1, 2, 0.5, 2.03),
  (1, 4, 0.5, 1.98),

  (2, 1, 0.5, 10.01),
  (2, 2, 0.5, 1.99),
  (2, 5, 0.5, 1.47),

  (3, 1, 0.5, 10.07),
  (3, 3, 0.5, 2.06),
  (3, 4, 0.5, 1.55),
  (3, 6, 0.5, 1.53),

  (4, 1, 0.5, 10.02),
  (4, 5, 0.5, 1.57),
  (4, 6, 0.5, 1.03),
  (4, 7, 0.5, 0.99);
