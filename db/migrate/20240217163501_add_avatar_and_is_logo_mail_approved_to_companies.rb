class AddAvatarAndIsLogoMailApprovedToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :avatar, :string
    add_column :companies, :is_logo_mail_approved, :boolean, null: false, default: false
  end
end
