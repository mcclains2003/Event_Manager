class TYLetter

  def self.save_thank_you_letters(id, form_letter)
    
    Dir.mkdir("output") unless Dir.exists? "output"

    filename = "output/thanks_#{id}.html"

    File.open(filename, 'w') do |file|
      file.puts form_letter
    end
  
  end

end