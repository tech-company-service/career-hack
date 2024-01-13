class CreateTechnologyTechnologyCategories < ActiveRecord::Migration[7.0]
  def up
    create_table :technology_technology_categories do |t|
      t.integer :technology_id
      t.integer :technology_category_id

      t.timestamps
    end
  end

  def down
    drop_table :technology_technology_categories
  end
end
