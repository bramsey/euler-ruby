#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal: 
#  Find the sum of all products whose multiplicand/multiplier/product identity
#  can be written as a 1 through 9 pandigital.


def pandigital?(a, b, prod)
  str = a.to_s + b.to_s + prod.to_s
  return false if str.length != 9 || str.include?('0')
  str.split(//).uniq.join.length == 9
end

@products = []

def check(a, b)
  prod = a*b
  if pandigital?(a, b, prod)
    @products << prod
  end 
end

2.upto(9) do |a|
  1000.upto(10000/a) do |b|
    check(a, b)
  end
end

10.upto(99) do |a|
  100.upto(10000/a) do |b|
    check(a, b)
  end
end

puts @products.uniq.inject(:+)