class AddDefaultValueToOrderOfRotation < ActiveRecord::Migration
  def change
    change_column_null :cases, :order_of_rotational_symmetry, false, 4
  end
end
