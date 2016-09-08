class Post < ApplicationRecord
  belongs_to :author, :foreign_key => :user_id, class_name: "User"

  validates :body, presence: true
end
