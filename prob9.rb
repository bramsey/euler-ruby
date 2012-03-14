#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the product abc where a+b+c = 1000 and {a, b, c} is a 
#  pythagorian triplet.

def is_triplet?( a, b, c )
  (a*a + b*b) == (c*c)
end 

def trip2
  1.upto(1000) do |i|
    i.upto(1000 - i) do |j|
      j.upto(1000 - i - j) do |k|
        return i*j*k if (i + j + k == 1000) && is_triplet?(i, j, k)
      end
    end
  end
end

puts trip2

