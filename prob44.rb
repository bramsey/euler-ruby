#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Problem: http://projecteuler.net/problem=44

@pents = []
@cache = []

def pent?(p)
  n = ((Math.sqrt(1+(24*p)))+1)/6
  n.to_i == n
end

def find_pair
  1.upto(1000000) do |n|
    p = (n*(3*n-1))/2
    
    @pents.each do |k|
      j = p-k
      d = k-j
      if d > 0
        return d if @cache[j] && @cache[d]
      end
    end
    @pents << p
    @cache[p] = true
  end
  0
end

puts find_pair
