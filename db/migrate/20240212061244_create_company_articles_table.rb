class CreateCompanyArticlesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :company_articles do |t|
      t.references :company, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.string :url
      t.string :ogp_image_url
      t.timestamps
    end
  end
end
