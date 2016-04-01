class AddAlgorithmToCases < ActiveRecord::Migration
  def change
    add_column :cases, :algorithm, :string
  end
end
