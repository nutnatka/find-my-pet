# == Schema Information
#
# Table name: pets
#
#  id              :bigint           not null, primary key
#  name            :string
#  species         :string
#  breed           :string
#  sex             :string
#  sterilized      :boolean
#  date_of_birth   :date
#  color           :string
#  additional_info :text
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Pet < ApplicationRecord
  belongs_to :user
  has_many :places, dependent: :destroy
  has_one_attached :avatar

  validates :avatar, file_size: { less_than_or_equal_to: 10.megabytes, message: 'is too big. It should be less than %{count}' },
                     file_content_type: { allow: %w[image/jpeg image/png image/gif image/hiec], message: 'only allows jpeg, hiec png and gif' }

  validates :name, :species, :sex, :color, presence: true

  enum species: { cat: 1, dog: 2 }
  enum sex: { male: 1, female: 2, undefined: 3 }

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [:name] + Array.new(6) { |index| [:name, index + 2] }
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
