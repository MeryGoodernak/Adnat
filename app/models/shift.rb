class Shift < ApplicationRecord
  belongs_to :user
  belongs_to :organisation

  validates :started_at, :ended_at, presence: true
  validates :started_at, comparison: { less_than: :ended_at }
  validates :break_length, comparison: { less_than: :shift_length_minutes }

  def shift_length_minutes
    ((ended_at - started_at) * 24 * 60).to_i
  end

  def net_work_minutes
    shift_length_minutes - break_length
  end

  def shift_cost(rate)
    (net_work_minutes / 60) * rate
  end
end
