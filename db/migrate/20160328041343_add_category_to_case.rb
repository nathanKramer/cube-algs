class AddCategoryToCase < ActiveRecord::Migration
  def change
    add_reference :cases, :category, index: true, foreign_key: true
  end
end
