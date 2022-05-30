# == Schema Information
#
# Table name: pets
#
#  id              :bigint           not null, primary key
#  name            :string
#  species         :integer
#  breed           :string
#  sex             :integer
#  sterilized      :boolean
#  date_of_birth   :date
#  color           :string
#  additional_info :text
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#
require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
