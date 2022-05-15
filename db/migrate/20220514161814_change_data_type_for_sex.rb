class ChangeDataTypeForSex < ActiveRecord::Migration[6.1]
  def change
    change_column :pets, :sex, 'integer USING CAST(sex AS integer)'
  end
end
