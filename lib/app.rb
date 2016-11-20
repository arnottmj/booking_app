#!/usr/bin/env ruby
require 'json'

requested_time = ARGV[0]
file = File.read('../Support/availability_slots.json')
data_hash = JSON.parse(file)

def determine_booking(time_requested, available_slots) 

end




