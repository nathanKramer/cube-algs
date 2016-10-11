# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160401101943) do

  create_table "algorithms", force: :cascade do |t|
    t.string   "algorithm"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.integer  "case_id"
    t.integer  "angle"
  end

  add_index "algorithms", ["algorithm"], name: "index_algorithms_on_algorithm", unique: true

  create_table "cases", force: :cascade do |t|
    t.string   "case_type"
    t.string   "diagram"
    t.string   "nickname"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_involutory"
    t.integer  "order_of_rotational_symmetry", null: false
    t.integer  "case_a_id"
    t.integer  "case_b_id"
    t.string   "algorithm"
    t.string   "algorithm_notes"
    t.integer  "category_name_id"
  end

  add_index "cases", ["category_name_id"], name: "index_cases_on_category_name_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true

  create_table "reflections", force: :cascade do |t|
  end

end
