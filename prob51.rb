#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the smallest prime which, by replacing part of the number 
#  (not necessarily adjacent digits) with the same digit, is part 
#  of an eight prime value family.

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
  count
end

def max_count_for_perms(num, num_digits)
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

def set?(p)
  str = p.to_s
  len = str.length
  1.upto(len) do |c|
    count = max_count_for_perms(str, c)
    return true if count == 8
  end
  return false
end

def find_prime
  @primes.each {|prime| return prime if set?(prime) }
  return 0
end

puts find_prime
