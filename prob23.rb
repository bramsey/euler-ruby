#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the sum of all the positive integers which cannot 
#  be written as the sum of two abundant numbers.

@abund_cache = []

def sum_factors(num)
  sum = 0
  (1..(num/2)).each {|f| sum += f if (num % f == 0)}
  puts sum
  sum
end

@abundants = []
@sum = 0

def not_abund_sum?(num)
  @abundants.each do |abund|
    return false if @abund_cache[num - abund]
  end
  return true
end

def calc_sum_non_abund
  1.upto(28123) do |num|
  
    @sum += num if not_abund_sum?(num)
  
    if ((num % 5 == 0) || (num % 2 == 0)) && num < 28111
      sum = sum_factors(num)
      if sum > num
        @abundants << num 
        @abund_cache[num] = true
      end
    end
  end
end

calc_sum_non_abund

puts @sum