class AddCaseAlgorithmsHasMany < ActiveRecord::Migration
  def change
    add_belongs_to :algorithms, :case
  end
end
