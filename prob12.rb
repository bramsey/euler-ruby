#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the first triangle number to have over five hundred divisors.

def fc( num )
  count = 0
  (1..(Math.sqrt(num)).floor).each {|divisor| count += 1 if (num % divisor == 0)}
  count*2
end

def first_to_five
  i = 1
  factor_count, sum = 1, 0

  while factor_count < 500
    sum += i
    i += 1
    factor_count = fc(sum)
  end
  sum
end

puts first_to_five
