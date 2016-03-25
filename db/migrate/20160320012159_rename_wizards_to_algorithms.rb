class RenameWizardsToAlgorithms < ActiveRecord::Migration
  def change
    rename_table :wizards, :algorithms
  end
end
