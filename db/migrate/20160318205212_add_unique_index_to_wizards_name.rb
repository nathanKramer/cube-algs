class AddUniqueIndexToWizardsName < ActiveRecord::Migration
  def change
    add_index :wizards, :name, unique: true
  end
end
