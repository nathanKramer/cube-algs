class AddCaseNumberToCase < ActiveRecord::Migration
  def change
    add_column :cases, :case_number, 'integer', unique: true
  end
end
