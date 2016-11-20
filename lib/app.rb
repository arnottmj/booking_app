require 'json'

file = File.read('file-name-to-be-read.json')
data_hash = JSON.parse(file)