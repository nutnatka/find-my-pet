# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  title       :string
#  content     :text
#  status      :integer          default("published"), not null
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  pet_id      :bigint           not null
#  place_id    :bigint
#  date        :date
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :pet, optional: true
  belongs_to :place, optional: true

  has_rich_text :content

  validates :title, :category_id, presence: true
  validates :pet_id, :place_id, presence: true, allow_nil: true

  paginates_per 12

  scope :with_lost_pet, -> { joins(:category).merge(Category.lost_pet) }
  scope :with_found_pet, -> { joins(:category).merge(Category.found_pet) }
  scope :with_pet_to_adopt, -> { joins(:category).merge(Category.pet_to_adopt) }
  scope :with_success_stories, -> { joins(:category).merge(Category.success_story) }
  scope :with_recommendations, -> { joins(:category).merge(Category.recommendation) }

  enum status: { published: 0, archived: 1 }
end
