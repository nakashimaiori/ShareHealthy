class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :title, presence: true
  validates :content, presence: true


  def favorited_by?(user)
    # if user_id.nil?
    favorites.where(user_id: user.id).exists?
    # end
  end


  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return find(Favorite.group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id))
    when 'dislikes'
      return find(Favorite.group(:post_id).order(Arel.sql('count(post_id) asc')).pluck(:post_id))
    end
  end

end
