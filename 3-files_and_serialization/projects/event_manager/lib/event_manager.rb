require 'csv'
require 'erb'
require 'google/apis/civicinfo_v2'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_number(phone_number)
  phone = phone_number

  if phone.length == 11
    if phone[0] == '1'
      phone = phone[1..]
    end
  end

  if phone.length != 10
    phone = phone.gsub(" ", "")
    phone = phone.gsub("-", "")
    phone = phone.gsub(".", "")
    phone = phone.gsub("(", "")
    phone = phone.gsub(")", "")
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

puts 'EventManager initialized.'
contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
    id = row[0]
    name = row[:first_name]
    phone = clean_phone_number(row[:homephone])
    zipcode = clean_zipcode(row[:zipcode])

    puts "#{phone} - #{zipcode}: #{name}"

    # legislators = legislators_by_zip_code(zipcode)
    # form_letter = erb_template.result(binding)
    # save_thank_you_letter(id, form_letter)
  end