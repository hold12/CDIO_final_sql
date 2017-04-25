USE dbweight;

/* must be dropped in this order to avoid constraint violations */
/*DROP TABLE IF EXISTS produktbatchkomponent;
DROP TABLE IF EXISTS produktbatch;
DROP TABLE IF EXISTS operatoer;
DROP TABLE IF EXISTS receptkomponent;
DROP TABLE IF EXISTS recept;
DROP TABLE IF EXISTS raavarebatch;
DROP TABLE IF EXISTS raavare;*/

DROP TABLE IF EXISTS productbatchcomponent;
DROP TABLE IF EXISTS productbatch;
DROP TABLE IF EXISTS operator;
DROP TABLE IF EXISTS recipecomponent;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS ingredientbatch;
DROP TABLE IF EXISTS ingredient;

CREATE TABLE operator(
  operator_id INT PRIMARY KEY,
  operator_firstname TEXT,
  operator_lastname TEXT,
  initials TEXT,
  cpr TEXT,
  password TEXT
) ENGINE=innoDB;
 
CREATE TABLE ingredient(
  ingredient_id INT PRIMARY KEY,
  ingredient_name TEXT,
  supplier TEXT
) ENGINE=innoDB;

CREATE TABLE ingredientbatch(
  ingredientbatch_id INT PRIMARY KEY,
  ingredient_id INT,
  amount REAL,
  FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
) ENGINE=innoDB;

CREATE TABLE recipe(
  recipe_id INT PRIMARY KEY,
  recipe_name TEXT
) ENGINE=innoDB;

CREATE TABLE recipecomponent(
  recipe_id INT,
  ingredient_id INT,
  nominated_net_weight REAL,
  tolerance REAL,
  PRIMARY KEY (recipe_id, ingredient_id),
  FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
) ENGINE=innoDB;

CREATE TABLE productbatch(
  productbatch_id INT PRIMARY KEY,
  status INT,
  recipe_id INT,
  FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
) ENGINE=innoDB;

CREATE TABLE productbatchcomponent(
  productbatch_id INT,
  ingredientbatch_id INT,
  tare REAL,
  net_weight REAL,
  operator_id INT,
  PRIMARY KEY (productbatch_id, ingredientbatch_id),
  FOREIGN KEY (productbatch_id) REFERENCES productbatch(productbatch_id),
  FOREIGN KEY (ingredientbatch_id) REFERENCES ingredientbatch(ingredientbatch_id),
  FOREIGN KEY (operator_id) REFERENCES operator(operator_id)
) ENGINE=innoDB;

INSERT INTO operator(operator_id, operator_firstname, operator_lastname, initials, cpr, password) VALUES
(1, 'Angelo', 'A', 'AA', '070770-7007', 'lKje4fa'),
(2, 'Antonella', 'B', 'AB', '080880-8008', 'atoJ21v'),
(3, 'Luigi', 'C', 'LC', '090990-9009', 'jEfm5aQ');

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


 
