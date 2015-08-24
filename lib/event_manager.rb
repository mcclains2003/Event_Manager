require 'csv'
require 'sunlight/congress'
require 'erb'
require_relative 'zipcode'
require_relative 'phone_number'
require_relative 'ty_letter'

class EventManager

  def initialize
    Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"
    puts "EventManager Initialized!"
  end

  def legislators_by_zipcode(zipcode)
    legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
  end

  # def save_thank_you_letters (id, form_letter)
    
  #   Dir.mkdir("output") unless Dir.exists? "output"

  #   filename = "output/thanks_#{id}.html"

  #   File.open(filename, 'w') do |file|
  #     file.puts form_letter
  #   end
  
  # end

  def run(filename)
    contents = CSV.open(filename, headers: true, header_converters: :symbol)

    template_letter = File.read "./form_letter.erb"
    erb_template = ERB.new template_letter

    contents.each do |row|
      id = row[0]
      name = row[:first_name]
      phone = PhoneNumber.clean_phone_num(row[:homephone])
      zipcode = Zipcode.clean_zipcode(row[:zipcode])

      legislators = legislators_by_zipcode(zipcode)

      form_letter = erb_template.result(binding)

      TYLetter.save_thank_you_letters(id, form_letter)

    end

  end

end