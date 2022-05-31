class RemoveForeignKeyfromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :messages, column: :user_id
    remove_foreign_key :messages, column: :conversation_id
  end
end
