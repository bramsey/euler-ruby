#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the sum of the numbers on the diagonals in a 1001 by 1001 spiral.

def solve
  step, n, sum = 2, 1, 1
  1.upto(2000) do |i|
    step += 2 if (i-1) % 4 == 0 unless i == 1
    n += step
    sum += n
  end
  sum
end


puts solve