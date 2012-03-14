#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Which starting number in the sequence under one million produces
#  the longest chain.

def chain_count(start)
  n = start
  count = 1
  
  while n > 1
    (n % 2) == 0 ?
      n /= 2 :
      n = (3*n+1)
    count += 1
  end
  
  count
end

def longest_chain
  max = 0
  max_start = 0

  (1..999999).step(2) do |start|  
    curr = chain_count(start)
  
    if curr > max
      max = curr
      max_start = start
    end
  end
  max_start
end

puts longest_chain
