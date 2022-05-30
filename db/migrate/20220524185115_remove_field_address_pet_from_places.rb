class RemoveFieldAddressPetFromPlaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :places, :address, :string
    remove_reference :places, :pet, null: false, foreign_key: true
  end
end
