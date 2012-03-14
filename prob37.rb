#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal: 
#  Find the sum of the only eleven primes that are 
#  both truncatable from left to right and right to left.

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

def left_truncable?(n)
  str = n.to_s
  len = str.length-1
  1.upto(len) do |i|
    return false unless prime?(str[i..len].to_i)
  end
  return true
end

def right_truncable?(n)
  str = n.to_s
  while str != ''
    return false unless prime?(str.to_i)
    str.chop!
  end
  true
end

def truncable?(n)
  if right_truncable?(n)
    return true if left_truncable?(n)
  end
  false
end

def solve
  sum = 0
  count = 0
  (11..1000001).step(2) do |n|
    if truncable?(n)
      sum += n 
      count += 1
      return sum if count == 11
    end
  end
  sum
end

puts solve
