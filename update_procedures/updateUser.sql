DROP PROCEDURE IF EXISTS updateUser;
DELIMITER //
CREATE PROCEDURE updateUser(
  IN user_id        INT(11),
  IN user_firstname TEXT,
  IN user_lastname  TEXT,
  IN initials           TEXT,
  IN password           TEXT,
  IN is_active          BIT
)
  BEGIN
    SET @user_id_v = user_id;
    SET @user_firstname_v = user_firstname;
    SET @user_lastname_v = user_lastname;
    SET @initials_v = initials;
    SET @password_v = password;
    SET @is_active_v = is_active;
    SET @s = 'UPDATE user
      SET user_firstname = ?
      , user_lastname = ?
      , initials = ?
      , password = ?
      , is_active = ?
      WHERE user_id = ?';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @user_firstname_v, @user_lastname_v, @initials_v, @password_v, @is_active_v, @user_id_v;
    DEALLOCATE PREPARE statement;
  END//
DELIMITER ;