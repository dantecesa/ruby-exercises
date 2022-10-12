require 'csv'
puts 'Event Manager Initialized!'

contents = CSV.open('event_attendees.csv', headers: true)

contents.each do |row|
  name = row[2]
  puts name
end