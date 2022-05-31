class RemoveForeignKeyfromComments < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :comments, column: :post_id
    remove_foreign_key :comments, column: :user_id
  end
end
