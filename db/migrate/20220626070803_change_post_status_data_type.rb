class ChangePostStatusDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :status, :integer, using: 'status::integer', default: 0, null: false
  end
end
