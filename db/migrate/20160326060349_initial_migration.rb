class InitialMigration < ActiveRecord::Migration
  def change
    create_table 'algorithms', force: :cascade do |t|
      t.string   'algorithm'
      t.datetime 'created_at',           null: false
      t.datetime 'updated_at',           null: false
      t.text     'description'
      t.integer  'case_id'
      t.integer  'angle'
    end

    add_index 'algorithms', ['algorithm'], name: 'index_algorithms_on_algorithm', unique: true

    create_table 'cases', force: :cascade do |t|
      t.string   'case_type'
      t.string   'diagram'
      t.string   'nickname'
      t.datetime 'created_at',                   null: false
      t.datetime 'updated_at',                   null: false
      t.boolean  'is_involutory'
      t.integer  'order_of_rotational_symmetry', null: false
      t.integer  'case_a_id'
      t.integer  'case_b_id'
    end

    create_table 'reflections', force: :cascade do |t|
    end
  end
end
