class CreateJobOffer < ActiveRecord::Migration[7.0]
  def up
    create_table :job_offers do |t|
      t.references :company, null: false, foreign_key: true
      t.integer "occupation_type", null: false
      t.timestamps
    end
  end

  def down
    drop_table :job_offers
  end
end
