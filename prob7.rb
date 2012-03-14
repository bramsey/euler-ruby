#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the 10 001st prime number

def factors( num )
  facts = []
  (2..(Math.sqrt(num).floor)).each {|divisor| facts << divisor if (num % divisor == 0)}
  facts
end

def isPrime?( num )
  return false if ((num % 2 == 0) || (num % 3 == 0))
  
  k, i = 1, 1
  
  while i <= (Math.sqrt(num))
    i = 6*k-1
    return false if  (num % i == 0)
    i = 6*k+1
    return false if (num % i == 0)
    k += 1
  end
  true
end

def nth_prime(n)
  i = 15
  counter = 6
  
  while counter < n
    counter += 1 if isPrime?(i)
    i += 2 unless counter == n
  end
  return i
end

puts nth_prime(10001)
