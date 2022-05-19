class RemovePostIdFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :categories, column: :post_id
  end
end
