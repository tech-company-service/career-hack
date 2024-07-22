class CreateUserTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :user_technologies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :technology, null: false, foreign_key: true
      t.integer :proficiency_level, null: false, default: 0

      t.timestamps
    end
  end
end
