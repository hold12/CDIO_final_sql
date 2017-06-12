DROP VIEW IF EXISTS web_userroles;
CREATE VIEW web_userroles(user_id, role_name, permission_names) AS
  SELECT user.user_id, role.role_name, GROUP_CONCAT(permission_name) AS permission_names
  FROM user
    JOIN user_role
      ON user.user_id = user_role.user_id
    JOIN role
      ON user_role.role_id = role.role_id
    JOIN role_permission
      ON role.role_id = role_permission.role_id
    JOIN permission
      ON role_permission.permission_id = permission.permission_id
  GROUP BY user.user_id,role_name;