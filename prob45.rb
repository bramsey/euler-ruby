#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the next triangle number after 40755 that is also pentagonal and hexagonal.

@pent, @hex = {}, {}

def pent?(p)
  n = ((Math.sqrt(1+(24*p)))+1)/6
  n.to_i == n
end

def find_num
  1.upto(1000000) do |n|
    t = (n*(n+1))/2
    p = (n*(3*n-1))/2
    h = n*(2*n-1)
    if @pent[t] && @hex[t]
      return t if n > 285
    end
      
    @pent[p] = true
    @hex[h] = true
  end
  0
end

puts find_num

