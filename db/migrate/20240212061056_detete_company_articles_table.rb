class DeteteCompanyArticlesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :company_articles
  end
end
