DROP VIEW IF EXISTS adm_user;
CREATE VIEW adm_user(user_id, firstname, lastname, initials, roles, permissions) AS
  SELECT user.user_id,
    user.firstname,
    user.lastname,
    user.initials,
    GROUP_CONCAT(DISTINCT role.role_name),
    GROUP_CONCAT(DISTINCT permission.permission_name)
  FROM user
    JOIN user_role
      ON user.user_id = user_role.user_id
    JOIN role
      ON user_role.role_id = role.role_id
    JOIN role_permission
      ON role.role_id = role_permission.role_id
    JOIN permission
      ON role_permission.permission_id = permission.permission_id
  GROUP BY user.user_id, user.firstname, user.lastname, user.initials
  ORDER BY firstname, lastname;
