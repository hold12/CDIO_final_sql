DROP VIEW IF EXISTS adm_user;
CREATE VIEW adm_user(id, first_name, last_name, initials, roles, permissions) AS
  SELECT user.user_id,
    user.user_firstname,
    user.user_lastname,
    user.initials,
    GROUP_CONCAT(DISTINCT role.role_name),
    GROUP_CONCAT(DISTINCT permission.permission_name)
  FROM user
    JOIN user2role
      ON user.user_id = user2role.user_id
    JOIN role
      ON user2role.role_id = role.role_id
    JOIN role2permission
      ON role.role_id = role2permission.role_id
    JOIN permission
      ON role2permission.permission_id = permission.permission_id
  GROUP BY user.user_id, user_firstname, user_lastname, initials
  ORDER BY user_firstname, user_lastname;