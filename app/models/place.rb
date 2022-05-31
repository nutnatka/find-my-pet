# == Schema Information
#
# Table name: places
#
#  id         :bigint           not null, primary key
#  name       :string
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Place < ApplicationRecord
end
