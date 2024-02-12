class ChangeArticleColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :ogp_image_url, :string
    add_column :articles, :ogp_image_url, :string
    remove_column :articles, :published_at, :datetime
    rename_column :articles, :link, :url
  end
end
