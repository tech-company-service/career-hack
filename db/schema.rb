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

ActiveRecord::Schema[7.0].define(version: 2024_02_17_163501) do
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
    t.text "detailed_initial_salary"
    t.string "avatar"
    t.boolean "is_logo_mail_approved"
  end

  create_table "company_abouts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_abouts_on_company_id"
  end

  create_table "company_articles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "title", null: false
    t.text "description"
    t.string "url"
    t.string "ogp_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_articles_on_company_id"
  end

  create_table "company_benefits", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_benefits_on_company_id"
  end

  create_table "company_projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_projects_on_company_id"
  end

  create_table "company_services", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "company_id"
    t.string "name", null: false
    t.text "description", null: false
    t.string "launched_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interns", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.string "link", null: false
    t.datetime "entry_deadline_date"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer "period"
    t.string "site"
    t.integer "style_type", null: false
    t.integer "recruitment_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_interns_on_company_id"
  end

  create_table "job_offer_technologies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "job_offer_id", null: false
    t.bigint "technology_id", null: false
    t.index ["job_offer_id"], name: "index_job_offer_technologies_on_job_offer_id"
    t.index ["technology_id"], name: "index_job_offer_technologies_on_technology_id"
  end

  create_table "job_offers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.text "description"
    t.index ["company_id"], name: "index_job_offers_on_company_id"
  end

  create_table "technologies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_type", null: false
    t.index ["name"], name: "index_technologies_on_name", unique: true
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "company_abouts", "companies"
  add_foreign_key "company_articles", "companies"
  add_foreign_key "company_benefits", "companies"
  add_foreign_key "company_projects", "companies"
  add_foreign_key "interns", "companies"
  add_foreign_key "job_offer_technologies", "job_offers"
  add_foreign_key "job_offer_technologies", "technologies"
  add_foreign_key "job_offers", "companies"
end
