#!/usr/bin/env ruby
require 'json'
require 'Time'

raise 'Please enter a single argument in the form hh:mm' if ARGV.length != 1
requested_time = ARGV[0]

begin
  Time.parse(requested_time)
rescue
  raise 'Please enter a valid time in the format hh:mm'
else
  parsed_requested_time = Time.parse(requested_time)
end

file = File.read('../Support/availability_slots.json')
data_hash = JSON.parse(file)

available_slots = data_hash["availability_slots"]
available_times = Array.new()

available_slots.each do |slot|
  parsed_time = Time.parse(slot["time"])
  available_times << parsed_time
end

sorted_available_times = available_times.sort

slot_booked = sorted_available_times.find{|time| time >= parsed_requested_time}

raise 'No available slots' if !slot_booked

p "#{slot_booked.strftime('%H')}:#{slot_booked.strftime('%M')}"



slot_booked_string = "#{slot_booked.strftime('%H')}:#{slot_booked.strftime('%M')}:#{slot_booked.strftime('%S')}"

available_slots.each do |slot|
  if slot["time"] == slot_booked_string
    available_slots.delete(slot)
    break
  end
end

updated_available_slots = {"availability_slots" => available_slots}

File.open("../Support/availability_slots.json", "w") do |f|
  f.write(updated_available_slots.to_json)
end



