class AddAllowNotificationColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :allow_notification, :boolean, default: false
  end
end
