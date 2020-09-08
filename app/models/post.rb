class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
