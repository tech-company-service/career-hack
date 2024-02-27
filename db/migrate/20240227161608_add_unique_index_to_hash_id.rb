class AddUniqueIndexToHashId < ActiveRecord::Migration[7.0]
  def change
    add_index :companies, :hash_id, unique: true
  end
end
