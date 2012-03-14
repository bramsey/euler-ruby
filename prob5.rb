#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the smallest positive number that is evenly 
#  divisible by all of the numbers from 1 to 20.

def divisor?( num, max )
  3.upto(max) do |i|
    return false unless num % i == 0
  end
  return true
end

def factorial( num )
  num.downto(1).inject {|prod, i| prod *= i}
end


def smallest_divisor
  fact = factorial(20)
  (16..fact).step(16) do |i|
    return i if divisor?( i, 20 )
  end
  return fact
end

puts smallest_divisor
