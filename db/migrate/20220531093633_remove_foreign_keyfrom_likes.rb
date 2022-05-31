class RemoveForeignKeyfromLikes < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :likes, column: :user_id
    remove_foreign_key :likes, column: :post_id
    remove_foreign_key :likes, column: :comment_id
    remove_foreign_key :likes, column: :message_id
    remove_foreign_key :likes, column: :place_id
  end
end
