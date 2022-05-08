# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  body            :text
#  user_id         :bigint           not null
#  conversation_id :bigint           not null
#  read            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  has_many :likes, dependent: :destroy
end
