class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :breed
      t.string :sex
      t.boolean :sterilized
      t.date :date_of_birth
      t.string :color
      t.text :additional_info
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
