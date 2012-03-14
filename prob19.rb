#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the number of Sundays that fell on the first of the month 
#  during the twentieth century (1 Jan 1901 to 31 Dec 2000).


class Day
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end

class Month
  attr_accessor :days
  
  def initialize
    @days = []
  end
end

class Year
  attr_accessor :months
  
  def initialize
    @months = []
  end
end

@day_counter = -1
DAYS = %w{Monday Tuesday Wednesday Thursday Friday Saturday Sunday}

def is_leap?(y)
  y += 1900

  if y % 100 == 0
    y % 400 == 0 ? ( return true ) : ( return false )
  else
    y % 4 == 0 ? ( return true ) : ( return false )
  end
end

def find_day_count(m, y)
  if [3, 5, 8, 10].include?(m)
    day_count = 30
  elsif m == 1
    day_count = is_leap?(y) ? 29 : 28
  else
    day_count = 31
  end
end

def next_day
  # cycle through days of the week and return the correct one
  @day_counter += 1
  DAYS[@day_counter % 7]
end

def populate_years
  years = []

  0.upto(100) do |y|
    year = Year.new
    0.upto(11) do |m|
      month = Month.new
      day_count = find_day_count(m, y)
      day_count.times { month.days << Day.new(next_day) }
    
      year.months << month
    end
  
    years << year
  end
  years
  
end

@years = populate_years

sunday_count = 0

@years[1...@years.length].each do |year|
  year.months.each {|month| sunday_count += 1 if month.days[0].name == 'Sunday'}
end

puts sunday_count




      
  