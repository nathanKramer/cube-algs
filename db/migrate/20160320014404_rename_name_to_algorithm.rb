class RenameNameToAlgorithm < ActiveRecord::Migration
  def change
    rename_column :algorithms, :name, :algorithm
  end
end
