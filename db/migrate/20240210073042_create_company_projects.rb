class CreateCompanyProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :company_projects do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
