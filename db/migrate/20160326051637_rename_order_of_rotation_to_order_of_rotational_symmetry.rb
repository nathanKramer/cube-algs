class RenameOrderOfRotationToOrderOfRotationalSymmetry < ActiveRecord::Migration
  def change
    rename_column :cases, :order_of_rotation, :order_of_rotational_symmetry
  end
end
