DROP VIEW IF EXISTS view_operator;
CREATE VIEW view_operator(operator_id, operator_firstname, operator_lastname,initials,cpr,password, is_active) AS
  SELECT operator_id,
    operator_firstname,
    operator_lastname,
    initials,
    cpr,
    password,
    is_active
  FROM operator
  ORDER BY operator_firstname, operator_lastname;