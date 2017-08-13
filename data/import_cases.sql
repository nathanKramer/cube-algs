.mode csv
.separator ,
.headers on
.import data/import_cases.csv CasesTemp

INSERT INTO Cases(
  case_type,
  diagram,
  nickname,
  order_of_rotational_symmetry,
  created_at,
  updated_at
) SELECT *, datetime('now'), datetime('now') FROM CasesTemp;

DROP TABLE CasesTemp;
