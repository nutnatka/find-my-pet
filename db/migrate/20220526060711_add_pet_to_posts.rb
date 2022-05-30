class AddPetToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :pet, null: false, foreign_key: true
  end
end
