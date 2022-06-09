class AddDefaultCategories < ActiveRecord::Migration[6.1]

  def up
    change_column_default :categories, :created_at, -> { 'CURRENT_TIMESTAMP' }
    change_column_default :categories, :updated_at, -> { 'CURRENT_TIMESTAMP' }
    Category.insert_all(
      [
        { id: 12, name: 'recommendations'},
        { id: 8, name: 'lost_pets'},
        { id: 9, name: 'found_pets'},
        { id: 11, name: 'success_stories'},
        { id: 10, name: 'pets_to_adopt'}
      ],
      unique_by: :id)
  end

  def down
    change_column_default :categories, :created_at, nil
    change_column_default :categories, :updated_at, nil
  end

end
