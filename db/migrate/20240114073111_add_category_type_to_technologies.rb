class AddCategoryTypeToTechnologies < ActiveRecord::Migration[6.0]
  def up
    add_column :technologies, :category_type, :integer, null: false
  end

  def down
    remove_column :technologies, :category_type
  end
end

