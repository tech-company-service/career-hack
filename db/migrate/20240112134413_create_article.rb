class CreateArticle < ActiveRecord::Migration[7.0]
  def up
    create_table :articles do |t|
      t.string "title", null: false
      t.string "link", null: false, limit: 2083, collation: "utf8mb4_unicode_ci"
      t.text "description"
      t.datetime "published_at", null: false
      t.timestamps
    end
  end

  def down
    drop_table :articles
  end
end
