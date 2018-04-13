class UpdateReferencesToAlgorithms < ActiveRecord::Migration[5.1]
  def up
    rename_column :cases, :algorithm, :solution
    rename_column :cases, :algorithm_notes, :solution_notes
  end

  def down
    rename_column :cases, :solution, :algorithm
    rename_column :cases, :solution_notes, :algorithm_notes
  end
end
