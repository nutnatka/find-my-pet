class AddPetToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :pet, foreign_key: true
  end
end
