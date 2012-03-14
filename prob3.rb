#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the largest prime factor of the number 600851475143.

def factors( num )
  facts = []
  (2..(Math.sqrt(num).floor)).each {|divisor| facts << divisor if (num % divisor == 0)}
  facts
end

def isPrime?( num )
  factors(num).empty?
end

def largest_prime( num )
  i = Math.sqrt(num).to_i
  
  while i > 1
    return i if (num % i == 0) && isPrime?(i)
    i -= 1
  end
  return num
end

puts largest_prime(600851475143)
