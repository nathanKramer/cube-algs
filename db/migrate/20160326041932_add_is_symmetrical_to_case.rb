class AddIsSymmetricalToCase < ActiveRecord::Migration
  def change
    add_column :cases, :is_symmetrical, :boolean
  end
end
