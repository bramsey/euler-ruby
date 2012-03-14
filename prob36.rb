#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the sum of all numbers, less than one million, 
#  which are palindromic in base 10 and base 2.

def palin?(n)
  nstring = n.to_s
  if nstring.reverse == nstring
    bstring = n.to_s(2)
    return true if bstring.reverse == bstring
  end
  false
end

sum = 0
(1...1000000).step(2) {|n| sum += n if palin?(n)}

puts sum