#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the product of the coefficients, a and b, for the quadratic 
#  expression that produces the maximum number of primes for consecutive 
#  values of n, starting with n = 0.

@prime_cache = [false, false]

def abs(n)
  n < 0 ? n*(-1) : n
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

def prime?(n)
  return false if n == 0
  if @prime_cache[n].nil?
    @prime_cache[n] = isPrime?(n)
  end
  @prime_cache[n]
end

def test(a, b)
  n = 0
  while prime?(abs(n**2 + (a*n) + b))
    n += 1 
  end
  n
end

def max_product
  max = 0
  max_product = 0
  
  (-1000).upto(1000) do |a|
    (-1000).upto(1000) do |b|
      chain = test(a, b)
      if chain > max
        max = chain
        max_product = a*b
      end
    end
  end
  return max_product, max
end

results = max_product
puts "#{results[0]} -> #{results[1]}"
