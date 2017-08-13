class AddCaseNumberForeignKeyToAlgorithm < ActiveRecord::Migration
  def up
    add_column :algorithms, :case_number, 'integer'
    add_index :algorithms, :case_number
    add_foreign_key :algorithms, :cases, column: :case_number, primary_key: :case_number
  end

  def down
    remove_foreign_key :algorithms, column: :case_number
    remove_index :algorithms, column: :case_number
    remove_column :algorithms, :case_number
  end
end
