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
  password TEXT,
  is_active BIT NOT NULL
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
