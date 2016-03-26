class AddAngleToAlgorithm < ActiveRecord::Migration
  def change
    add_column :algorithms, :angle, :integer
  end
end
