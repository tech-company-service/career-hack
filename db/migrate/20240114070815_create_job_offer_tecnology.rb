class CreateJobOfferTecnology < ActiveRecord::Migration[7.0]
  def up
    create_table :job_offer_technologies do |t|
      t.references :job_offer, null: false, foreign_key: true
      t.references :technology, null: false, foreign_key: true
    end
  end

  def down
    drop_table :job_offer_technologies
  end
end
