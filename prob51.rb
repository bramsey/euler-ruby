#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the prime below one million that can be written as the sum of the
#  most consecutive primes.

@primes = []
@prime_cache = [false, false]

def prime?(n)
  @prime_cache[n]
end

def prime_sieve(max)
  2.upto(max) do |n|
    unless @prime_cache[n] == false
      @prime_cache[n] = true
      @primes << n
      n.upto(max) do |i|
        m = i*n
        break if m > max
        @prime_cache[m] = false
      end
    end
  end 
end

prime_sieve(1000000)

def prime_perm_count(num, digits)
  correct_digit = num[digits.first]
  digits.each do |d|
    return 0 unless num[d] == correct_digit
  end
  count = 0
  0.upto(9) do |r|
    digits.each do |d|
      num[d] = r.to_s
    end
    if prime?(num.to_i)
      count += 1 if num.length == num.to_i.to_s.length
    end
  end
  #puts "#{num}: #{count} | #{digits}"
  count
end

def max_count_for_perms(num, num_digits)
  #puts num_digits
  digit_combs = (0...num.length).to_a.combination(num_digits).to_a
  max = 1
  digit_combs.each do |digits|
    count = prime_perm_count(num.clone, digits)
    return 8 if count >= 8
    if count > max
      max = count
    end
  end
  return max
  
end

#puts max_count_for_perms("120383", 3)
#puts prime_perm_count("56003", [2, 3])    


def set?(p)
  str = p.to_s
  len = str.length
  1.upto(len) do |c|
    count = max_count_for_perms(str, c)
    return true if count == 8
  end
  return false
  
end

#puts set?(120381)
def find_prime
  @primes.each do |prime|
    return prime if set?(prime)
  end
  return 0
end

puts find_prime
