#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the sum of all the numbers that can be written as 
#  the sum of fifth powers of their digits.

def is_sum?(n, k)
  str = n.to_s
  sum = 0.upto(str.length-1).inject(0) {|result, i| result + (str[i].to_i)**k}
  sum == n
end

sum = 0
2.upto(295245) {|i| sum += i if is_sum?(i, 5)}

puts sum