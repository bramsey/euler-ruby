#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the sum of the even-valued fibonacci terms below one million.

def fib_sum_even(max)
  a, b, n, sum = 1, 2, 0, 2
  while n < max
    n = a+b
    a, b = b, n
    sum += n if n.even?
  end
  sum
end

puts fib_sum_even(4000000)
  