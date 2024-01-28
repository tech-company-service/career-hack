class AddCategoryTypeToTechnology < ActiveRecord::Migration[7.0]
  def change
    add_column :technologies, :category_type, :integer, null: false
  end
end
