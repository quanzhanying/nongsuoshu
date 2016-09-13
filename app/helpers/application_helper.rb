module ApplicationHelper
  def render_formatted_time(time)
    time.to_formatted_s(:localdb)[0..18] if time
end
end
