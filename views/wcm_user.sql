DROP VIEW IF EXISTS wcm_user;
CREATE VIEW wcm_user(user_id, firstname, lastname) AS
  SELECT user_id,
    firstname,
    lastname
  FROM user
  ORDER BY user_id;