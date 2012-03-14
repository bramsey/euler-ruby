#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the largest n-digit pandigital prime that exists.

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

def pandigital?(a, b, prod)
  str = a.to_s + b.to_s + prod.to_s
  return false if str.length != 9 || str.include?('0')
  str.split(//).uniq.join.length == 9
end

def perms(str)
  perms = str.split(//).permutation(str.length).to_a
  perms
end



def find_max_for_perm(perm_str)
  perms = perms(perm_str)
  max = 0

  0.upto(perms.length-1) do |i|
    num = perms[i].join.to_i
    max = num if prime?(num)
  end
  max
end

def find_max
  perm_str = '123456789'

  while perm_str != ''
    max = find_max_for_perm(perm_str)
    return max if max > 0
    perm_str.chop!
  end
  0
end
  

puts find_max