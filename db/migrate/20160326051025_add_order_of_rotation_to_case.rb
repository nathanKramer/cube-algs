class AddOrderOfRotationToCase < ActiveRecord::Migration
  def change
    remove_column :cases, :is_symmetrical
    remove_column :cases, :is_totally_symmetrical
    add_column :cases, :order_of_rotation, :integer
  end
end
