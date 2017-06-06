DROP PROCEDURE IF EXISTS insertUser;
DELIMITER //
CREATE PROCEDURE insertUser(
  IN firstname TEXT,
  IN lastname  TEXT,
  IN initials       TEXT,
  IN password       TEXT,
  IN roles          TEXT
)
  BEGIN
    START TRANSACTION;
    SET @user_id_v = (SELECT IFNULL(MAX(user_id), 0) + 1
                      FROM user);
    SET @firstname_v = firstname;
    SET @lastname_v = lastname;
    SET @initials_v = initials;
    SET @password_v = password;
    SET @roles_v = roles;

    SET @s = 'INSERT INTO user(user_id, firstname, lastname, initials, password, is_active) VALUES(?,?,?,?,?,1);';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @user_id_v, @firstname_v, @lastname_v, @initials_v, @password_v;
    DEALLOCATE PREPARE statement;

    SELECT @user_id_v AS user_id;

    SET @s = CONCAT('INSERT INTO user_role(user_id, role_id)
    SELECT DISTINCT user.user_id, role.role_id
    FROM user
    CROSS JOIN role
    WHERE user_id = ?
      AND role_id IN (',@roles_v,')');

    PREPARE statement FROM @s;
    EXECUTE statement USING @user_id_v;
    DEALLOCATE PREPARE statement;

    COMMIT;
  END//
DELIMITER ;