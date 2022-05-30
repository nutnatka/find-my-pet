class RemoveFieldNameFromTableName < ActiveRecord::Migration[6.1]
  def change
    remove_column :places, :pet_id
    remove_column :places, :address
  end
end
