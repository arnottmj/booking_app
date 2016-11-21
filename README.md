Setup:

Please ensure bundler is installed, then use the 'bundle' command to acquire the necessary gems.

Running and behaviour:

Execute 'app.rb' from the command line with a single argument (time of booking, hh:mm).
The app will find the next available slot, print the time to the console, and then remove that slot from the JSON file.
Any bookings requested 'before' 8am (i.e. the first slot listed in the JSON) will be given the first available slot.
Any bookings requested 'after' 3pm (i.e. the last slot in the JSON) will raise an exception with the message "no available bookings".

Testing:

Using RSpec. Tests currently failing for booking due to a Time parsing problem I have been unable to locate.
