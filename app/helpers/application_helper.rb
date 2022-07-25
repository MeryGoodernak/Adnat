module ApplicationHelper
  # Hours worked</th>
  #       <th>Shift cost
  def net_work_hours(shift)
    net_work_minutes = shift.net_work_minutes
    "#{net_work_minutes / 60}h #{net_work_minutes % 60}min"
  end
end
