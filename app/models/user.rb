class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable

  validates :username, length: { within: 4..15 },
                       uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates_uniqueness_of :email, case_sensitive: false

  def has_posts?
    !self.posts.empty?
  end

  def already_liked?(staff)
    self.likes.find_by(likeable: staff) ? true : false
  end
end
