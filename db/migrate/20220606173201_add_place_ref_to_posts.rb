class AddPlaceRefToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :place, foreign_key: true
  end
end
