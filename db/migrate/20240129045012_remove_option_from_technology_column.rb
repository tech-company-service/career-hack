class RemoveOptionFromTechnologyColumn < ActiveRecord::Migration[7.0]
  def change
    change_column_null :technologies, :description, true
  end
end
