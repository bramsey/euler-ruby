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

def chain(index)
  sum = 0
  max_chain = 0
  max_sum = 0
  last = @primes.last
  index.upto(@primes.length-1) do |i|
    sum += @primes[i]
    break if sum > last
    if prime?(sum)
      max_chain = (i-index)
      max_sum = sum
    end
  end
  return max_chain, max_sum
end

def longest_chain(max)
  prime_sieve(max)
  max = 0
  max_sum = 0
  @primes.each_index do |i|
    c = chain(i)
    if c[0] > max
      max = c[0]
      max_sum = c[1]
    end
  end
  return max_sum
end

puts longest_chain(1000000)

