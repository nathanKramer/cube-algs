class RemoveWazatarFromAlgorithms < ActiveRecord::Migration
  def change
    remove_column :algorithms, :wazatar
  end
end
