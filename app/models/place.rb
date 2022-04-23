class Place < ApplicationRecord
  belongs_to :pet
  has_many :likes, dependent: :destroy
end
