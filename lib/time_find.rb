class TimeFind

  def self.hour_picker(hash)
    hour = hash.select do |hour, regnum|
      regnum == hash.values.max
    end
    hour.keys.join(', ')
  end

  def self.day_picker(hash)
    day = hash.select do |day, regnum|
      regnum == hash.values.max
    end
    days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    day = day.keys
    days[day[0]]
  end

end