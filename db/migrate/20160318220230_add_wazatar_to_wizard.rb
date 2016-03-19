class AddWazatarToWizard < ActiveRecord::Migration
  def change
    add_column :wizards, :wazatar, :string
  end
end
