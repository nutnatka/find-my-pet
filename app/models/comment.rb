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
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, dependent: :destroy
end
