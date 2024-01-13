class CreateCompanyTechnologyTechnologyCategories < ActiveRecord::Migration[7.0]
  def up
    create_table :company_technology_technology_categories do |t|
      t.integer :company_id
      t.integer :technology_technology_category_id

      t.timestamps
    end
  end

  def down
    drop_table :company_technology_technology_categories
  end
end
