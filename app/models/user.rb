class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :comments
  has_many :likes
  has_many :posts, foreign_key: 'author_id'

  # Attributes: id, name, email, encrypted_password,
  # reset_password_token,
  # reset_password_sent_at,
  # remember_created_at,
  # created_at,
  # updated_at,
  # bio,
  # photo

  # Validations
  validates :name, presence: true
  validates :posts_count, numericality: {
    greater_than_or_equal_to: 0,
    only_integer: true,
    allow_blank: true
  }

  # method
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
