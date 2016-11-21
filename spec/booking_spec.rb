require 'booking'

describe 'Booking' do

  describe 'finding availability' do

    context 'when the requested time is before the earliest available' do

      subject {Booking.new(Time.parse("08:00"), availability)}

      it 'should return the earliest available' do
        expect(subject.next_available_apt).to eq "08:00"
      end
    end

    context 'when there is no next available appointment' do

      subject {Booking.new(Time.parse("08:30"), availability)}

      it 'should return nil' do
        expect{subject.next_available_apt}.to eq nil
      end
    end
  end

  describe 'updating availability' do
    subject {Booking.new(Time.parse("08:00"), availability)}

    it 'should return an array with a booked slot removed' do
      expect{subject.update_availability(Time.parse('08:00'))}.to be_instance_of Array
    end
  end

  def availability

    [
      {
        "time":"08:00:00",
        "slot_size":10,
        "doctor_id":1
      },
      {
        "time":"08:10:00",
        "slot_size":10,
        "doctor_id":1
      },
      {
        "time":"08:10:00",
        "slot_size":10,
        "doctor_id":2
      },
      {
        "time":"08:20:00",
        "slot_size":10,
        "doctor_id":1
      }
    ]
  end
end
