class Genre < ApplicationRecord

  has_many :posts
  validates :name, presence: true, length: {maximum: 15}

end
