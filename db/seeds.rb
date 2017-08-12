# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.connection.execute <<-SQL
CREATE TEMP TABLE CasesTemp(case_type,diagram,nickname,order_of_rotational_symmetry);
.separator ,
.import data/import_cases.csv CasesTemp
INSERT INTO Cases(case_type,diagram,nickname,order_of_rotational_symmetry, created_at,updated_at) SELECT *, datetime('now'), datetime('now') FROM CasesTemp;
DROP TABLE CasesTemp;
SQL
