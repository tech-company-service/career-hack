class AddHashIdToInterns < ActiveRecord::Migration[7.0]
  def change
    add_column :interns, :hash_id, :string, limit: 15
  end
end
