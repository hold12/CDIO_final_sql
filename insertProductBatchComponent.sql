USE dbweight;

DROP PROCEDURE IF EXISTS insertProductbatchcomponent;

DELIMITER //

CREATE PROCEDURE insertProductbatchcomponent(
  IN productbatch_id    INT(11),
  IN ingredientbatch_id INT(11),
  IN tare               DOUBLE,
  IN net_weight         DOUBLE,
  IN operator_id        INT(11)
)
  BEGIN
    SET @s = CONCAT(
        'INSERT INTO productbatchcomponent(productbatch_id, ingredientbatch_id, tare, net_weight, operator_id) VALUES(
        ', productbatch_id, ',', ingredientbatch_id, ',', tare, ',', net_weight, ',', operator_id, ');'
    );
    PREPARE statement FROM @s;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;

  END//

DELIMITER ;