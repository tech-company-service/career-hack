class AddMissionValueVisionToCompany < ActiveRecord::Migration[7.0]
  def up
    add_column :companies, :mission, :string, after: :recruit_url
    add_column :companies, :value, :string, after: :mission
    add_column :companies, :vision, :string, after: :value
  end

  def down
    remove_column :companies, :mission
    remove_column :companies, :value
    remove_column :companies, :vision
  end
end
