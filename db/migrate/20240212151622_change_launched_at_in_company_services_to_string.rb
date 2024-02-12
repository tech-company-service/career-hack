class ChangeLaunchedAtInCompanyServicesToString < ActiveRecord::Migration[7.0]
  def change
    change_column :company_services, :launched_at, :string
  end
end
