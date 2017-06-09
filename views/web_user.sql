DROP VIEW IF EXISTS web_user;
CREATE VIEW web_user(user_id, firstname, lastname, initials, password, is_active) AS
  SELECT user_id,
    firstname,
    lastname,
    initials,
    password,
    is_active
  FROM user
  ORDER BY user_id;