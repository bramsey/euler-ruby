#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the first term in the Fibonacci sequence to contain 1000 digits.

def fib_iter(a, b, p, q, count)
  if count == 0
    return b
  elsif count % 2 == 0
    fib_iter(a, b, (p*p + q*q), (2*p*q + q*q), (count/2))
  else
    fib_iter((b*q + a*q + a*p), (b*p + a*q), p, q, (count-1))
  end
end

def fib(n)
  fib_iter(1, 0, 0, 1, n)
end

def find_fib_by_digits(digits)
  ((digits*4.5).floor).upto((digits*5).floor) do |n|
    return n if fib(n).to_s.length == digits
  end
end

puts find_fib_by_digits(1000)
