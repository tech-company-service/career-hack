class CreateUserCompanySelectionPreferences < ActiveRecord::Migration[7.0]
  def up
    create_table :user_company_selection_preferences do |t|
      t.references :company_selection_preference, foreign_key: true, index: { name: 'index_user_company_on_preference_id' }
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :user_company_selection_preferences
  end
end
