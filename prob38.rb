#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the largest 1 to 9 pandigital 9-digit number that 
#  can be formed as the concatenated product of an integer with 
#  (1,2, ... , n) where n > 1.

# Assumption:
#  The largest concatenated product would likely result from a four digit base number
#  that when multiplied by two yields a five digit number.
#  The four digit number should start with 9.

def pandigital?(str)
  return false if str.length != 9 || str.include?('0')
  str.split(//).uniq.join.length == 9
end

def find_max_prod
  max = 918273645
  9000.upto(9999) do |n|
    
    prod = n.to_s + (2*n).to_s
    max = prod.to_i if prod.to_i > max && pandigital?(prod)
  end
  max
end

puts find_max_prod