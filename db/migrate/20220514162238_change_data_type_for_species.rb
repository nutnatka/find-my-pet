class ChangeDataTypeForSpecies < ActiveRecord::Migration[6.1]
  def change
    change_column :pets, :species, 'integer USING CAST(species AS integer)'
  end
end
