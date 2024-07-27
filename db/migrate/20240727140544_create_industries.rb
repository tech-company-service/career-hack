class CreateIndustries < ActiveRecord::Migration[7.0]
  def up
    create_table :industries do |t|
      t.string :name, null: false

      t.timestamps
    end
  end

  def down
    drop_table :industries
  end
end
