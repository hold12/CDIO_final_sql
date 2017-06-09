DROP VIEW IF EXISTS wcm_user;
CREATE VIEW wcm_user(user_id, firstname, lastname, initials, password, is_active) AS
  SELECT user_id,
    firstname,
    lastname,
    initials,
    password,
    is_active
  FROM user
  ORDER BY user_id;