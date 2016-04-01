class AddAlgorithmNotesToCase < ActiveRecord::Migration
  def change
    add_column :cases, :algorithm_notes, :string
  end
end
