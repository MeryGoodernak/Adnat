# frozen_string_literal: true

class Shift < ApplicationRecord
  attr_writer :shift_date, :start_time, :end_time

  belongs_to :user
  belongs_to :organisation

  before_validation :build_datetime_fields

  validates :started_at, :ended_at, presence: true
  validates :started_at, comparison: { less_than: :ended_at }
  validates :start_time, comparison: { less_than: :end_time }
  validates :break_length, comparison: { greater_than_or_equal_to: 0, less_than: :shift_length_minutes },
                           if: proc { |shift| shift.errors.empty? }

  def net_work_minutes
    shift_length_minutes - break_length
  end

  def shift_cost(rate)
    (net_work_minutes / 60.0) * rate
  end

  def shift_date
    started_at&.to_date
  end

  def start_time
    started_at&.to_time
  end

  def end_time
    ended_at&.to_time
  end

  private

  def build_datetime_fields
    self.started_at = "#{@shift_date} #{@start_time}"&.to_datetime
    self.ended_at = "#{@shift_date} #{@end_time}"&.to_datetime
  end

  def shift_length_minutes
    return 0 if ended_at.blank? || started_at.blank?

    ((ended_at.to_datetime - started_at.to_datetime) * 24 * 60).to_i
  end
end
