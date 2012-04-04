#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the number of values of nCr, for 1  n  100, 
#  are greater than one-million?

def fact(n)
  n.downto(1).inject(:*)
end

def comb(n, r)
  (fact(n))/(fact(n-r)*fact(r))
end

def find_count
  count = 0
  23.upto(100) do |n|
    4.upto(n-1) do |r|
      count += 1 if comb(n,r) > 1000000
    end
  end
  count
end

puts find_count
