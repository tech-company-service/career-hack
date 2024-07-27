class CreateCompanySelectionPreferences < ActiveRecord::Migration[7.0]
  def up
    create_table :company_selection_preferences do |t|
      t.string :name, null: false

      t.timestamps
    end
  end

  def down
    drop_table :company_selection_preferences
  end
end
