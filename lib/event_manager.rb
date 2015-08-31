require 'csv'
require 'sunlight/congress'
require 'erb'
require_relative 'zipcode'
require_relative 'phone_number'
require_relative 'ty_letter'
require_relative 'time_find'

class EventManager

  def initialize
    Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"
    puts "EventManager Initialized!"
  end

  def legislators_by_zipcode(zipcode)
    legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
  end

  def run(filename)
    contents = CSV.open(filename, headers: true, header_converters: :symbol)

    template_letter = File.read "./form_letter.erb"
    erb_template = ERB.new template_letter
    hour_counter = Hash.new(0)
    day_counter = Hash.new(0)

    contents.each do |row|
      id = row[0]
      name = row[:first_name]
      phone = PhoneNumber.clean_phone_num(row[:homephone])
      zipcode = Zipcode.clean_zipcode(row[:zipcode])
      time = DateTime.strptime(row[:regdate], "%m/%d/%y %k:%M")
      hour_counter[time.hour] += 1
      day_counter[time.wday] += 1

      legislators = legislators_by_zipcode(zipcode)

      form_letter = erb_template.result(binding)

      TYLetter.save_thank_you_letters(id, form_letter)

    end

    puts "The top hours for advertising are #{TimeFind.hour_picker(hour_counter)}"
    puts "The top day for advertising is #{TimeFind.day_picker(day_counter)}"

  end

end