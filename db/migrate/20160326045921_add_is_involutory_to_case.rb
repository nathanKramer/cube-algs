class AddIsInvolutoryToCase < ActiveRecord::Migration
  def change
    add_column :cases, :is_involutory, :boolean
  end
end
