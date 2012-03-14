#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the sum of all numbers which are equal to the sum of 
#  the factorial of their digits.

def fact(n)
  return 1 if n <= 1
  n.downto(1).inject(:*)
end

def is_sum?(n)
  str = n.to_s
  sum = 0.upto(str.length-1).inject(0) {|result, i| result + fact(str[i].to_i)}
  sum == n
end

def solve
  sum = 0
  3.upto(50000) do |i| 
    if is_sum?(i)
      sum += i 
    end
  end
  sum
end

sum = solve
puts sum