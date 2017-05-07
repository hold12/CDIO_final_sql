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
    SET @productbatch_id_v = productbatch_id;
    SET @ingredientbatch_id_v = ingredientbatch_id;
    SET @tare_v = tare;
    SET @net_weight_v = net_weight;
    SET @operator_id_v = operator_id;
    SET @s = 'INSERT INTO productbatchcomponent(productbatch_id, ingredientbatch_id, tare, net_weight, operator_id) VALUES(?,?,?,?,?);';
    
	PREPARE statement FROM @s;
    EXECUTE statement USING @productbatch_id_v, @ingredientbatch_id_v, @tare_v, @net_weight_v, @operator_id_v;
    DEALLOCATE PREPARE statement;
  END//
DELIMITER ;