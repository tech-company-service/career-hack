class AddRewardColumnToIntern < ActiveRecord::Migration[7.0]
  def up
    add_column :interns, :reward, :string
    add_column :interns, :capacity, :string
    add_column :interns, :necessary_requirements, :text
    add_column :interns, :welcome_requirements, :text
    add_column :interns, :technologies, :text

    remove_column :interns, :period, :integer

    change_column :interns, :entry_deadline_date, :string
    change_column :interns, :started_at, :string
    change_column :interns, :ended_at, :string
  end

  def down
    change_column :interns, :entry_deadline_date, :datetime
    change_column :interns, :started_at, :datetime
    change_column :interns, :ended_at, :datetime

    add_column :interns, :period, :integer
  
    remove_column :interns, :reward, :string
    remove_column :interns, :capacity, :string
    remove_column :interns, :necessary_requirements, :text
    remove_column :interns, :welcome_requirements, :text
    remove_column :interns, :technologies, :text
  end
end
