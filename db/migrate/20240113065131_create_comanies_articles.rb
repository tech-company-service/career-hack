class CreateComaniesArticles < ActiveRecord::Migration[7.0]
  def up
    create_table :company_articles do |t|
      t.references :company, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
    end
  end

  def down
    drop_table :company_articles
  end
end
