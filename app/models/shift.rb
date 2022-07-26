class Shift < ApplicationRecord
  attr_accessor :shift_date, :start_time, :end_time

  belongs_to :user
  belongs_to :organisation

  before_validation :build_datetime_fields

  validates :started_at, :ended_at, presence: true
  validates :started_at, comparison: { less_than: :ended_at }
  validates :break_length, comparison: { less_than: :shift_length_minutes }

  def build_datetime_fields
    self.started_at = "#{shift_date} #{start_time}".to_datetime
    self.ended_at = "#{shift_date} #{end_time}".to_datetime
  end

  def shift_length_minutes
    ((ended_at.to_datetime - started_at.to_datetime) * 24 * 60).to_i
  end

  def net_work_minutes
    shift_length_minutes - break_length
  end

  def shift_cost(rate)
    (net_work_minutes / 60) * rate
  end
end
