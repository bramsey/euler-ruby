#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the sum of all the multiples of 3 or 5 below 1000.

sum = 0
1.upto(999) {|n| sum += n if (n % 3 == 0 || n % 5 == 0)}

puts sum