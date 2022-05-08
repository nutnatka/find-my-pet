class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sender_conversations, class_name: 'Conversation', foreign_key: 'sender_id', dependent: :destroy
  has_many :recipient_conversations, class_name: 'Conversation', foreign_key: 'recipient_id', dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar

  validates :avatar, file_size: { less_than_or_equal_to: 150.kilobytes, message: 'should be less than %{count}' },
            file_content_type: { allow: %w[image/jpeg image/png image/gif], message: 'only allows jpeg, png and gif' }

  validates :name, :email, presence: true
  validates :password, presence: true, allow_nil: true
  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])/

    errors.add :password, 'must include at least one lowercase letter, one uppercase letter, and one digit.'
  end

  extend FriendlyId
  friendly_id :name, use: :slugged
end
