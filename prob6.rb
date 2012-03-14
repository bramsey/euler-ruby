#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the difference between the sum of the squares of 
#  the first one hundred natural numbers and the square of the sum.

def sum_of_squares( num )
  1.upto(num).inject(0) {|sum, i| sum += i**2}
end

def square_of_sum( num )
  sum = 1.upto(num).inject(0) {|sum, i| sum += i}
  sum**2
end

def diff(n)
  square_of_sum(n) - sum_of_squares(n)
end

puts diff(100)
