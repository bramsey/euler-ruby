#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the sum of the digits of the number 2^1000.

num = (2**1000).to_s

sum = 0
num.chars.each {|digit| sum += digit.to_i }

puts sum