class CreateUserDesiredIndustries < ActiveRecord::Migration[7.0]
  def change
    create_table :user_desired_industries do |t|
      t.references :industry, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
