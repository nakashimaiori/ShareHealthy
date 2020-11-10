class DayRecord < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :start_time, presence: true
  validates :breakfast, length: { maximum: 200 }
  validates :lunch, length: { maximum: 200 }
  validates :dinner, length: { maximum: 200 }
  validates :snack, length: { maximum: 200 }
  validates :memo, length: { maximum: 300 }
end
