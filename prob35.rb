#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the number of circular primes below one million.

@prime_cache = [false, false]

## begin miller rabin prime testing
def mr_expmod(base, exp, m)
  if (exp % 2 == 0) && exp != 0
    x = mr_expmod(base, (exp/2), m)
    square = (x**2) % m
    (square == 1) && (x != 1) && (x != (m-1)) ? (return 0) : (return square)
  elsif exp != 0
    x = mr_expmod(base, (exp-1), m)
    return ((base * x) % m)
  else
    return 1
  end
end

def mr(n)
  a = rand(n-1) + 1
  x = mr_expmod(a, (n-1), n)
  x == 1
end

def fast_prime(n, times)
  times -= 1 while  times != 0 && mr(n)
  times == 0
end

def prime?(n)
  @prime_cache[n] = fast_prime(n, 5) if @prime_cache[n].nil?
  @prime_cache[n]
end

def circular_prime?(n)
  return false unless prime?(n)
  str = n.to_s
  len = str.length-1
  
  0.upto(len+1) do |i|
    str = str[len] + str.chop
    break if str.to_i == n
    return false unless prime?(str.to_i)
  end
  prime?(str.to_i)
end

primes = []
(3...1000000).step(2) {|n| primes << n if circular_prime?(n)}
puts primes.length+1
