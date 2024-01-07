class CreateCompanies < ActiveRecord::Migration[7.0]
  def up
    create_table :companies do |t|
      t.string "name", null: false
      t.string "hash_id", limit: 15, collation: "utf8mb4_bin"
      t.text "description", null: false
      t.string "address", null: false
      t.integer "average_salary"
      t.integer "initial_salary"
      t.float "average_age"
      t.integer "employees"
      t.string "recruit_url"
      t.timestamps
    end
  end

  def down
    drop_table :companies
  end
end
