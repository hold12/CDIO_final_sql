DROP PROCEDURE IF EXISTS insertUser;
DELIMITER //
CREATE PROCEDURE insertUser(
  IN user_firstname TEXT,
  IN user_lastname  TEXT,
  IN initials       TEXT,
  IN password       TEXT
)
  BEGIN
    SET @user_id_v = (SELECT IFNULL(MAX(user_id), 0) + 1 FROM user);
    SET @user_firstname_v = user_firstname;
    SET @user_lastname_v = user_lastname;
    SET @initials_v = initials;
    SET @password_v = password;
    SET @s = 'INSERT INTO user(user_id, user_firstname, user_lastname, initials, password, is_active) VALUES(?,?,?,?,?,1);';

    PREPARE statement FROM @s;
    EXECUTE statement
    USING @user_id_v, @user_firstname_v, @user_lastname_v, @initials_v, @password_v;
    DEALLOCATE PREPARE statement;

    SELECT @user_id_v AS user_id;
  END//
DELIMITER ;