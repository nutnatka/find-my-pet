class AddContactInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :allow_email, :boolean
    add_column :users, :phone, :string
    add_column :users, :telegram, :string
    add_column :users, :viber, :string
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
  end
end
