#!/usr/bin/env ruby
require 'json'
require 'Time'
require_relative './Support/helper_methods.rb'
require_relative './lib/filehandler.rb'
require_relative './lib/booking.rb'

raise 'Please enter a single argument in the form hh:mm' if ARGV.length != 1

requested_time = ARGV[0]

parsed_requested_time = parse_time(requested_time)

available_slots = FileHandler.import('./Support/availability_slots.json')

booking = Booking.new(parsed_requested_time, available_slots)
slot_booked = booking.next_available_apt

raise 'No available slots' if !slot_booked

available_slots = booking.update_availability(slot_booked)

FileHandler.export('./Support/availability_slots.json', available_slots)

p booked_time_as_string(slot_booked)
