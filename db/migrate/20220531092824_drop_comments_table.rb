class DropCommentsTable < ActiveRecord::Migration[6.1]
  def change
    def up
      drop_table :comments
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
