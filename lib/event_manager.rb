require "csv"

class EventManager

  def initialize
    puts "EventManager Initialized!"
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

  def run(filename)
    contents = CSV.open(filename, headers: true, header_converters: :symbol)
    contents.each do |row|
      name = row[:first_name]

      zipcode = clean_zipcode(row[:zipcode])

      puts "#{name} #{zipcode}"
    end
  end

end
