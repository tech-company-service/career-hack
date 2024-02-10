class AddInitialSalaryDetailToCOmpany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :detailed_initial_salary, :text
  end
end
