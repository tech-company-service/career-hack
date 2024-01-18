class CreateIntern < ActiveRecord::Migration[7.0]
  def up
    create_table :interns do |t|
      t.references :company, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.string :link, null: false
      t.datetime :entry_deadline_date
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :period
      t.string :site
      t.integer :style_type, null: false
      t.integer :recruitment_type, null: false
      t.timestamps
    end
  end

  def down
    drop_table :interns if table_exists?(:interns)
  end
end
