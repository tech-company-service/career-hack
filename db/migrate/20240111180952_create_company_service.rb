class CreateCompanyService < ActiveRecord::Migration[7.0]
  def up
    create_table :company_services do |t|
      t.integer :company_id
      t.string :name, null: false
      t.text :description, null: false
      t.datetime :launched_at
      t.timestamps
    end
  end

  def down
    drop_table :company_services
  end
end
