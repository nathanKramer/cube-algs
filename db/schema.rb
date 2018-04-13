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

ActiveRecord::Schema.define(version: 20180413111829) do

  create_table "cases", force: :cascade do |t|
    t.string "case_type"
    t.string "diagram"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_involutory"
    t.integer "order_of_rotational_symmetry", null: false
    t.integer "case_a_id"
    t.integer "case_b_id"
    t.string "solution"
    t.string "solution_notes"
    t.integer "category_name_id"
    t.integer "case_number"
    t.index ["category_name_id"], name: "index_cases_on_category_name_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "reflections", force: :cascade do |t|
  end

  create_table "solutions", force: :cascade do |t|
    t.string "algorithm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "case_id"
    t.integer "angle"
    t.integer "case_number"
    t.index ["algorithm"], name: "index_solutions_on_algorithm", unique: true
    t.index ["case_number"], name: "index_solutions_on_case_number"
  end

end
