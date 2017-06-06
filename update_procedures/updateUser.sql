DROP PROCEDURE IF EXISTS updateUser;
DELIMITER //
CREATE PROCEDURE updateUser(
  IN user_id        INT(11),
  IN firstname TEXT,
  IN lastname  TEXT,
  IN initials           TEXT,
  IN password           TEXT,
  IN is_active          BIT
)
  BEGIN
    SET @user_id_v = user_id;
    SET @firstname_v = firstname;
    SET @lastname_v = lastname;
    SET @initials_v = initials;
    SET @password_v = password;
    SET @is_active_v = is_active;
    SET @s = 'UPDATE user
      SET firstname = ?
      , lastname = ?
      , initials = ?
      , password = ?
      , is_active = ?
      WHERE user_id = ?';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @firstname_v, @lastname_v, @initials_v, @password_v, @is_active_v, @user_id_v;
    DEALLOCATE PREPARE statement;
  END//
DELIMITER ;