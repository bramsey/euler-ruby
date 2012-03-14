#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the number of routes through a 20 by 20 grid.

# The solution is 40 c 20

def fact(n)
  n.downto(1).inject(:*)
end

def comb(n, r)
  (fact(n))/(fact(n-r)*fact(r))
end

puts comb(40, 20)