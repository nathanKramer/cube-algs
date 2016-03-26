class AddReflectionCaseToCase < ActiveRecord::Migration
  def change
    create_table :reflections do |t|
      add_belongs_to :cases, :case_a
      add_belongs_to :cases, :case_b
    end
  end
end
