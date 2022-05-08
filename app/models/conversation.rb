# == Schema Information
#
# Table name: conversations
#
#  id           :bigint           not null, primary key
#  recipient_id :integer
#  sender_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  # belongs_to :sender, foreign_key: :sender_id, class_name: User
  # belongs_to :recipient, foreign_key: :recipient_id, class_name: User
end
