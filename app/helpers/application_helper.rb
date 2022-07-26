# frozen_string_literal: true

module ApplicationHelper
  def net_work_hours(shift)
    net_work_minutes = shift.net_work_minutes
    "#{net_work_minutes / 60}h #{net_work_minutes % 60}min"
  end
end
