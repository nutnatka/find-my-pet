class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.string :ancestry

      t.timestamps
    end
  end
end
