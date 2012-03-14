#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the sum of the digits in the number 100!.

def fact(n)
  (1..n).inject(:*)
end

num = fact(100)

sum = 0
num.chars.each {|digit| sum += digit.to_i }
puts sum