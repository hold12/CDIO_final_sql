DROP VIEW IF EXISTS adm_operator;
CREATE VIEW adm_operator(id, first_name, last_name,initials,cpr) AS
  SELECT operator_id,
    operator_firstname,
    operator_lastname,
    initials,
    cpr
  FROM dbweight.operator
  ORDER BY operator_firstname, operator_lastname;