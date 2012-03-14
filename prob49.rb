#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Problem: http://projecteuler.net/problem=49

@primes = [2, 3, 5, 7]
@prime_cache = [false, false, true, true, false, true, false, true]

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

def prime?(n)
  return false if n <= 1
  @prime_cache[n] = isPrime?(n) if @prime_cache[n].nil?
  @prime_cache[n]
end

def perm?(a, b)
  a.to_s.split(//).sort == b.to_s.split(//).sort
end

def find_nums
  (1001..3339).step(2) do |a|
    if prime?(a) && a != 1487
      b = a + 3330
      if prime?(b) && perm?(a, b)
        c = b + 3330
        return a.to_s + b.to_s + c.to_s if prime?(c) && perm?(b, c)
      end
    end
  end
  0
end   

puts find_nums

