#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the sum of all the primes below two million.

@primes = []
@prime_cache = [false, false]

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

def sum_below(max)
  prime_sieve(max)
  @primes.inject(:+)
end

puts sum_below(2000000)
