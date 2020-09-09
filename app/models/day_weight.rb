class DayWeight < ApplicationRecord
  belongs_to :user

  validates :weight, presence: true
  validates :start_time, presence: true

  def self.chart_date
  	order(start_time: :asc).pluck('start_time', 'weight').to_h
  end
end
