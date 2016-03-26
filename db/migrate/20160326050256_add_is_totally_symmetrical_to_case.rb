class AddIsTotallySymmetricalToCase < ActiveRecord::Migration
  def change
    add_column :cases, :is_totally_symmetrical, :boolean
  end
end
