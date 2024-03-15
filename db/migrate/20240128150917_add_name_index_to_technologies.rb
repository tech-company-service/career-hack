class AddNameIndexToTechnologies < ActiveRecord::Migration[7.0]
  def change
    add_index :technologies, :name, unique: true
  end
end
