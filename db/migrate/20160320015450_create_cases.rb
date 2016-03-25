class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :case_type
      t.string :diagram
      t.string :nickname

      t.timestamps null: false
    end
  end
end
