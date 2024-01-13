# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_11_180952) do
  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "hash_id", limit: 15, collation: "utf8mb4_bin"
    t.text "description", null: false
    t.string "address", null: false
    t.integer "average_salary"
    t.integer "initial_salary"
    t.float "average_age"
    t.integer "employees"
    t.string "recruit_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_services", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "company_id"
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "launched_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_technology_technology_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "company_id"
    t.integer "technology_technology_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technologies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technology_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technology_technology_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "technology_id"
    t.integer "technology_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
