require 'csv'
puts 'Event Manager Initialized!'

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

contents.each do |row|
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])

    puts "#{name} #{zipcode}"
  end
