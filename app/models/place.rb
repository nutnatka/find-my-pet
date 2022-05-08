# == Schema Information
#
# Table name: places
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  latitude   :float
#  longitude  :float
#  pet_id     :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Place < ApplicationRecord
  belongs_to :pet
  has_many :likes, dependent: :destroy
end
