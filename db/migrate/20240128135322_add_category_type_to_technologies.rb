class AddCategoryTypeToTechnologies < ActiveRecord::Migration[7.0]
  def change
    remove_column :job_offers, :occupation_type, :integer
    add_column :job_offers, :name, :string, null: false
    add_column :job_offers, :description, :text
  end
end
