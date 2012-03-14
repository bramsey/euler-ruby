#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

sum = 1.upto(1000).inject(0) {|sum, n| sum += (n**n)}.to_s
len = sum.length
puts sum[(len-10)..(len-1)]