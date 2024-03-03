class AddUrlToCompanyServices < ActiveRecord::Migration[7.0]
  def change
    add_column :company_services, :url, :string
  end
end
