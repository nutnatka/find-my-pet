# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates_uniqueness_of :name

  scope :lost_pet, -> { where(name: 'lost_pets') }
  scope :found_pet, -> { where(name: 'found_pets') }
  scope :pet_to_adopt, -> { where(name: 'pets_to_adopt') }
  scope :success_story, -> { where(name: 'success_stories') }
  scope :recommendation, -> { where(name: 'recommendations') }
end
