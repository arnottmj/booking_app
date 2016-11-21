def parse_time time
  begin
    Time.parse(time)
  rescue
    raise 'Please enter a valid time in the format hh:mm'
  else
    Time.parse(time)
  end
end

def booked_time_as_string time
  "#{time.strftime('%H')}:#{time.strftime('%M')}"
end
