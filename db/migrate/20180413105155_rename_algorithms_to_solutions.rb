class RenameAlgorithmsToSolutions < ActiveRecord::Migration[5.1]
  def change
    rename_table :algorithms, :solutions
  end
end
