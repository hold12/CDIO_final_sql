INSERT INTO operator(operator_id, operator_firstname, operator_lastname, initials, cpr, password, is_active) VALUES
(1, 'Angelo', 'A', 'AA', '070770-7007', 'lKje4fa', 1),
(2, 'Antonella', 'B', 'AB', '080880-8008', 'atoJ21v', 1),
(3, 'Luigi', 'C', 'LC', '090990-9009', 'jEfm5aQ', 1);

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
(7, 7, 100);

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

(3, 1, 10.0, 0.1),
(3, 4, 1.5, 0.1),
(3, 5, 1.5, 0.1),
(3, 6, 1.0, 0.1),
(3, 7, 1.0, 0.1);

INSERT INTO productbatch(productbatch_id, recipe_id, status) VALUES
(1, 1, 2),
(2, 1, 2),
(3, 2, 2),
(4, 3, 1),
(5, 3, 0);

INSERT INTO productbatchcomponent(productbatch_id, ingredientbatch_id, tare, net_weight, operator_id) VALUES
(1, 1, 0.5, 10.05, 1),
(1, 2, 0.5, 2.03, 1),
(1, 4, 0.5, 1.98, 1),

(2, 1, 0.5, 10.01, 2),
(2, 2, 0.5, 1.99, 2),
(2, 5, 0.5, 1.47, 2),

(3, 1, 0.5, 10.07, 1),
(3, 3, 0.5, 2.06, 2),
(3, 4, 0.5, 1.55, 1),
(3, 6, 0.5, 1.53, 2),

(4, 1, 0.5, 10.02, 3),
(4, 5, 0.5, 1.57, 3),
(4, 6, 0.5, 1.03, 3),
(4, 7, 0.5, 0.99, 3);
