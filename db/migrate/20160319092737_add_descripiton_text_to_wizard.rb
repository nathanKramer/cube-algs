class AddDescripitonTextToWizard < ActiveRecord::Migration
  def change
    add_column :wizards, :description, :text
  end
end
