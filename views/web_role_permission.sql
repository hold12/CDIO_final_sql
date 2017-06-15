DROP VIEW IF EXISTS web_role_permission;
CREATE VIEW web_role_permission(permission_name, role_name) AS
  SELECT permission_name, role_name 
  FROM permission
  JOIN role_permission ON permission.permission_id = role_permission.permission_id
  JOIN role ON role_permission.role_id = role.role_id;
