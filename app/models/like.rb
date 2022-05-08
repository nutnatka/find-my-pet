# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  post_id    :bigint           not null
#  comment_id :bigint           not null
#  message_id :bigint           not null
#  place_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :comment
  belongs_to :message
  belongs_to :place
end
