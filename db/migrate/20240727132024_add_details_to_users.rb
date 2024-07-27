class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :nick_name, :string
    add_column :users, :graduate_year, :integer
    add_column :users, :target_position, :integer
    add_column :users, :introduction, :text
    add_column :users, :x_url, :string
    add_column :users, :qiita_url, :string
    add_column :users, :zenn_url, :string
    add_column :users, :github_url, :string
    add_column :users, :wantedly_url, :string
    add_column :users, :other_url, :string
    add_column :users, :research_content, :text
    add_column :users, :career_vision, :text
  end

  def down
    remove_column :users, :nick_name
    remove_column :users, :graduate_year
    remove_column :users, :target_position
    remove_column :users, :introduction
    remove_column :users, :x_url
    remove_column :users, :qiita_url
    remove_column :users, :zenn_url
    remove_column :users, :github_url
    remove_column :users, :wantedly_url
    remove_column :users, :other_url
    remove_column :users, :research_content
    remove_column :users, :career_vision
  end
end
