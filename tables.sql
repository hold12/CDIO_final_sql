DROP TABLE IF EXISTS productbatchcomponent;
DROP TABLE IF EXISTS productbatch;
DROP TABLE IF EXISTS role2permission;
DROP TABLE IF EXISTS user2role;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS permission;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS recipecomponent;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS ingredientbatch;
DROP TABLE IF EXISTS ingredient;

CREATE TABLE user(
  user_id INT PRIMARY KEY,
  user_firstname TEXT,
  user_lastname TEXT,
  initials TEXT,
  password TEXT,
  is_active BIT NOT NULL
) ENGINE=innoDB;

CREATE TABLE role(
  role_id INT PRIMARY KEY,
  role_name TEXT
) ENGINE=innoDB;

CREATE TABLE permission(
  permission_id INT PRIMARY KEY,
  permission_name TEXT
) ENGINE=innoDB;

CREATE TABLE role2permission(
  role_id INT,
  permission_id INT,
  PRIMARY KEY (role_id, permission_id),
  FOREIGN KEY (role_id) REFERENCES role(role_id),
  FOREIGN KEY (permission_id) REFERENCES permission(permission_id)
) ENGINE=innoDB;

CREATE TABLE user2role(
  user_id INT,
  role_id INT,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (role_id) REFERENCES role(role_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
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
  created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  finished_time TIMESTAMP NULL DEFAULT NULL,
  status INT,
  recipe_id INT,
  user_id INT,
  FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
) ENGINE=innoDB;

CREATE TABLE productbatchcomponent(
  productbatch_id INT,
  ingredientbatch_id INT,
  tare REAL,
  net_weight REAL,
  PRIMARY KEY (productbatch_id, ingredientbatch_id),
  FOREIGN KEY (productbatch_id) REFERENCES productbatch(productbatch_id),
  FOREIGN KEY (ingredientbatch_id) REFERENCES ingredientbatch(ingredientbatch_id)
) ENGINE=innoDB;
