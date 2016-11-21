class FileHandler

  def self.import file_location
    file = File.read(file_location)
    data_hash = JSON.parse(file)
    data_hash['availability_slots']
  end

  def self.export(file_location, file)
    updated_available_slots = {"availability_slots" => file}

    File.open(file_location, "w") do |f|
      f.write(updated_available_slots.to_json)
    end
  end
end
