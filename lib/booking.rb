class Booking

  attr_reader :availability

  def initialize(requested_time, available_times)
    @requested = requested_time
    @availability = available_times
  end

  def next_available_apt
    available_times = find_available_times(@availability)
    sorted_available_times = available_times.sort
    find_next(@requested, sorted_available_times)
  end

  def update_availability(booking)
    slot_booked_string = convert_to_string(booking)

    @availability.each do |slot|
      if slot["time"] == slot_booked_string
        @availability.delete(slot)
        break
      end
    end

    @availability
  end

  private

  def find_available_times(slots)
    available = Array.new()

    slots.each do |s|
      parsed_time = Time.parse(s["time"])
      available << parsed_time
    end

    available
  end

  def find_next(requested, availability)
    slot_booked = availability.find{|time| time >= requested}
    slot_booked
  end

  def convert_to_string time
    "#{time.strftime('%H')}:#{time.strftime('%M')}:#{time.strftime('%S')}"
  end
end
