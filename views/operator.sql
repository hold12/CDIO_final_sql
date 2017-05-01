DROP VIEW IF EXISTS view_operator;

CREATE VIEW view_operator(operator_id, operator_firstname, operator_lastname,initials,cpr,password) AS
  SELECT operator_id,
    operator_firstname,
    operator_lastname,
    initials,
    cpr,
    password
  FROM dbweight.operator
  ORDER BY operator_firstname, operator_lastname;