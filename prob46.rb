#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the smallest odd composite that cannot be written 
#  as the sum of a prime and twice a square.

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
  return false if n <= 1
  fast_prime(n, 10)
end
#end miller rabin test

@primes = [2, 3, 5, 7]

def conject?(n)
  @primes.each do |p|
    square = (n-p)/2
    root = Math.sqrt(square)
    return true if root.to_i == root
  end
  return false
end

def find_num
  (9...100000).step(2) do |n|
    if prime?(n)
      @primes << n
    else
      return n unless conject?(n)
    end
  end
  0
end   

puts find_num


