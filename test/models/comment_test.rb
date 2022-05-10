# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  name       :string
#  body       :text
#  user_id    :bigint           not null
#  post_id    :bigint           not null
#  ancestry   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
