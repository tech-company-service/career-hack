class CreateTechnologies < ActiveRecord::Migration[7.0]
  def up
    create_table :technologies do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
    end
  end

  def down
    drop_table :technologies
  end
end
