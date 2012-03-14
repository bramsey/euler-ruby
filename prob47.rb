#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the first four consecutive integers to have 
#  four distinct primes factors. What is the first of these numbers?

@primes = [2, 3, 5, 7]
@prime_cache = [false, false, true, true, false, true, false, true]

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
  
  @prime_cache[n] = fast_prime(n, 5) if @prime_cache[n].nil?
  @prime_cache[n]
end
#end miller rabin test

def distinct(facts)
  diff = facts & facts.uniq
  if diff != facts
    distincts = []
    counts = []
    facts.each {|f| counts[f] ? counts[f] += 1 : counts[f] = 1}
    counts.each_index do |i| 
      count = counts[i]
      if count
        distinct = i*count
        distincts << distinct
      end
    end
    return distincts
  end
  facts
end

def largest_prime_factor(num)
  return 1 if num < 2
  (Math.sqrt(num).floor).downto(1) do |n|
    if num % n == 0 && (n % 2 != 0 || n == 2)
      return n if prime?(n)
    end
  end
  1
end

def prime_factors(num)
  facts = []
  while num > 2
    fact = largest_prime_factor(num)
    if fact <= 1
      facts << num
      break
    end
    facts << fact
    num /= fact
  end
  distinct(facts)
end
  
def consec?(n, count)
  seen = []
  n.upto(n+count-1) do |i|
    facts = prime_factors(i)
    return false unless facts.length == count
    facts.each do |f|
      return false if seen[f]
      seen[f] = true
    end
  end
  true
end
  

def find_nums(count)
  1.upto(1000000) do |n|
    return n if consec?(n, count)
  end
  0 
end   

puts find_nums(4)

