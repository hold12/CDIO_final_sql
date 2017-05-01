DROP VIEW IF EXISTS view_operator;

CREATE VIEW view_operator(id, first_name, last_name,initials,cpr) AS
  SELECT operator_id,
    operator_firstname,
    operator_lastname,
    initials,
    cpr
  FROM dbweight.operator
  ORDER BY operator_firstname, operator_lastname;