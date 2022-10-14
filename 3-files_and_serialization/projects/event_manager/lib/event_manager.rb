require 'csv'
require 'erb'
require 'google/apis/civicinfo_v2'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_number(phone)
  if phone.length != 10
    phone.gsub!(" ", "")
    phone.gsub!("-", "")
    phone.gsub!(".", "")
    phone.gsub!("(", "")
    phone.gsub!(")", "")
  end

  if phone.length == 11
    if phone[0] == '1'
      phone = phone[1..]
    end
  end

  if phone.length == 10
    phone = "(#{phone[0..2]}) #{phone[3..5]}-#{phone[6..9]}"
  end

  if phone.length != 14
    phone = "Bad number!"
  end
  phone
end

def legislators_by_zip_code(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    )
    legislator_names = legislators.officials
  rescue => exception
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')
  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end  
end

def calculate_most_popular_registration_time_and_day(popular_registration_times, popular_registration_days, date_time)
  popular_registration_times[date_time.hour] += 1
  popular_registration_days[date_time.wday] += 1
end

def print_most_popular_registration_date_times(popular_registration_times, popular_registration_days)
  puts "The most popular registration time is: #{popular_registration_times.max_by {|_,value| value}[0]}:00"

  print "The most popular registration weekday is: "
  case popular_registration_days.max_by {|_,value| value}[0]
  when 0
    print 'Monday'
  when 1
    print 'Tuesday'
  when 2
      print 'Wednesday'
  when 3
    print 'Thursday'
  when 4
    print 'Friday'
  when 5
    print 'Saturday'
  when 6
    print 'Sunday'
  else
    print 'Unknown day'
  end
end

puts 'EventManager initialized.'
contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter
popular_registration_times = Hash.new(0)
popular_registration_days = Hash.new(0)

contents.each do |row|
    id = row[0]
    name = row[:first_name]
    phone = clean_phone_number(row[:homephone])
    zipcode = clean_zipcode(row[:zipcode])
    registration_date = DateTime.strptime(row[:regdate], '%m/%d/%y %H:%M')
    calculate_most_popular_registration_time_and_day(popular_registration_times, popular_registration_days, registration_date)

    # puts "#{name} #{phone}"
    # legislators = legislators_by_zip_code(zipcode)
    # form_letter = erb_template.result(binding)
    # save_thank_you_letter(id, form_letter)
  end

  print_most_popular_registration_date_times(popular_registration_times, popular_registration_days)