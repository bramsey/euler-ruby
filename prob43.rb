#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Problem: http://projecteuler.net/problem=43

PRIMES = [2, 3, 5, 7, 11, 13, 17]

def pandigital?(a, b, prod)
  str = a.to_s + b.to_s + prod.to_s
  return false if str.length != 9 || str.include?('0')
  str.split(//).uniq.join.length == 9
end

def perms(str)
  perms = str.split(//).permutation(str.length).to_a
  perms.collect {|perm| perm.join}
end

def interesting?(str)
  unless str[0] == '0'
    0.upto(6) do |i|
      return false unless (str[i+1..i+3].to_i) % PRIMES[i] == 0
    end
    return true
  end
  false
end

def find_sum_primes

  perms = perms('0123456789')

  sum = 0
  perms.each {|perm| sum += perm.to_i if interesting?(perm)}
  sum
end
puts find_sum_primes
