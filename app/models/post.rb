# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  title       :string
#  content     :text
#  status      :string
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :pet
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_rich_text :content

  validates :title, :category_id, presence: true
  paginates_per 12
end
