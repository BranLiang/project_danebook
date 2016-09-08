class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true, counter_cache: true

  validates :user_id, uniqueness: { scope: [:likeable_id, :likeable_type] }
end
