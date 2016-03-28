CREATE TEMP TABLE CasesTemp(case_type,diagram,nickname,created_at,updated_at,is_involutory,order_of_rotational_symmetry,case_a_id,case_b_id);
.separator ,
.import import_cases.csv CasesTemp
INSERT INTO Cases(case_type,diagram,nickname,created_at,updated_at,is_involutory,order_of_rotational_symmetry,case_a_id,case_b_id) SELECT * FROM CasesTemp;
DROP TABLE CasesTemp;