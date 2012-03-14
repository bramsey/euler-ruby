#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the value of d<1000 for which 1/d contains the 
#  longest recurring cycle in its decimal fraction part.

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

def find_cycle
  n = 1000**1000
  prime_sieve(999)
  (@primes.length-1).downto(0) do |i|
    div = (n/@primes[i]).to_s
    len = div.length
    puts "#{@primes[i]}: #{div[(len-50)...len]}"
  end
end

find_cycle

