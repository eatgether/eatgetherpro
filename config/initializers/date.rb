class Date
  def self.this_saturday
    Date.today.end_of_week()-1.days
  end

  def self.this_sunday
    Date.today.end_of_week()
  end
end
