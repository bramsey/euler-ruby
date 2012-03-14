#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Problem: http://projecteuler.net/problem=33

nums, denoms = [], []

1.upto(9) do |n|
  1.upto(9) do |a|
    1.upto(9) do |b|
      num = (10.0*a)+n
      denom = (10.0*n)+b
      a *= 1.0
      b *= 1.0
      if (num/denom) == (a/b)  && (a/b) < 1
        nums << num
        denoms << denom
      end
    end
  end
end

num_prod = nums.inject(:*)
denoms_prod = denoms.inject(:*)

puts "#{num_prod} / #{denoms_prod}"
puts (denoms_prod/num_prod)
    