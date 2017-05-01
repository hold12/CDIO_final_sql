DROP VIEW IF EXISTS view_operator;

CREATE VIEW view_operator(id, first_name, last_name,initials,cpr,password) AS
  SELECT operator_id,
    operator_firstname,
    operator_lastname,
    initials,
    cpr,
    password
  FROM dbweight.operator
  ORDER BY operator_firstname, operator_lastname;