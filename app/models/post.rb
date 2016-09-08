class Post < ApplicationRecord
  belongs_to :author, :foreign_key => :user_id, class_name: "User"
  has_many :likes, :as => :likeable, dependent: :destroy
  has_many :comments, :as => :commentable, dependent: :destroy

  validates :body, presence: true
end
