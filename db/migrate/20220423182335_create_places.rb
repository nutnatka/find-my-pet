class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
