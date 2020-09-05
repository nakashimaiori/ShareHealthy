class DayWeight < ApplicationRecord
  belongs_to :user

  validates :weight, presence: true
  validates :start_time, presence: true
end
