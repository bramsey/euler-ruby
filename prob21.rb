#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Evaluate the sum of all the amicable numbers under 10000.

def factors_for( num )
  facts = []
  (1..(num/2)).each {|divisor| facts << divisor if (num % divisor == 0)}
  facts
end

def populate_factors
  facts = []
  
  1.upto(10000) {|n| facts[n] = factors_for(n)} 
  facts 
end

@factors = populate_factors

def populate_sum_factors
  sum_factors = [0]

  @factors[1...@factors.length].each do |factor_set|
    sum = 0
    factor_set.each{|factor| sum += factor}
    
    sum_factors << sum
  end
  
  sum_factors
end

@sum_factors = populate_sum_factors

def populate_amicables
  amicables = [0]
  
  1.upto(10000) {|n| amicables << n if (n != @sum_factors[n]) && (@sum_factors[@sum_factors[n]] == n)}
  
  amicables
end
amicables = populate_amicables

puts amicables.inject(:+)

