class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  validates :post_id, presence: true
end
