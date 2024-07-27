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

ActiveRecord::Schema[7.0].define(version: 2024_07_27_140629) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "hash_id", limit: 15
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
    t.boolean "is_logo_mail_approved", default: false, null: false
    t.index ["hash_id"], name: "index_companies_on_hash_id", unique: true
  end

  create_table "company_abouts", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_abouts_on_company_id"
  end

  create_table "company_articles", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "title", null: false
    t.text "description"
    t.string "url"
    t.string "ogp_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_articles_on_company_id"
  end

  create_table "company_benefits", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_benefits_on_company_id"
  end

  create_table "company_projects", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_projects_on_company_id"
  end

  create_table "company_selection_preferences", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_services", force: :cascade do |t|
    t.integer "company_id"
    t.string "name", null: false
    t.text "description", null: false
    t.string "launched_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interns", force: :cascade do |t|
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
    t.string "hash_id", limit: 15
    t.index ["company_id"], name: "index_interns_on_company_id"
  end

  create_table "job_offer_technologies", force: :cascade do |t|
    t.bigint "job_offer_id", null: false
    t.bigint "technology_id", null: false
    t.index ["job_offer_id"], name: "index_job_offer_technologies_on_job_offer_id"
    t.index ["technology_id"], name: "index_job_offer_technologies_on_technology_id"
  end

  create_table "job_offers", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.text "description"
    t.index ["company_id"], name: "index_job_offers_on_company_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_type", null: false
    t.index ["name"], name: "index_technologies_on_name", unique: true
  end

  create_table "user_company_selection_preferences", force: :cascade do |t|
    t.bigint "company_selection_preference_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_selection_preference_id"], name: "index_user_company_on_preference_id"
    t.index ["user_id"], name: "index_user_company_selection_preferences_on_user_id"
  end

  create_table "user_desired_industries", force: :cascade do |t|
    t.bigint "industry_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_id"], name: "index_user_desired_industries_on_industry_id"
    t.index ["user_id"], name: "index_user_desired_industries_on_user_id"
  end

  create_table "user_technologies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "technology_id", null: false
    t.integer "proficiency_level", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["technology_id"], name: "index_user_technologies_on_technology_id"
    t.index ["user_id"], name: "index_user_technologies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nick_name"
    t.integer "graduate_year"
    t.integer "target_position"
    t.text "introduction"
    t.string "x_url"
    t.string "qiita_url"
    t.string "zenn_url"
    t.string "github_url"
    t.string "wantedly_url"
    t.string "other_url"
    t.text "research_content"
    t.text "career_vision"
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
  add_foreign_key "user_company_selection_preferences", "company_selection_preferences"
  add_foreign_key "user_company_selection_preferences", "users"
  add_foreign_key "user_desired_industries", "industries"
  add_foreign_key "user_desired_industries", "users"
  add_foreign_key "user_technologies", "technologies"
  add_foreign_key "user_technologies", "users"
end
