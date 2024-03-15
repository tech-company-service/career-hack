class CreateCompanyBenefits < ActiveRecord::Migration[7.0]
  def up
    create_table :company_benefits do |t|
      t.references :company, null: false, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
    end
  end

  def down
    drop_table :company_benefits
  end
end
