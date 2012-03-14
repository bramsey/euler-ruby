#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the number of different ways 2 pounds can be made using any number of coins.

DENOM = [0, 1, 2, 5, 10, 20, 50, 100, 200]

def cc(amount, kinds_of_coins)
  if amount == 0
    return 1
  elsif amount < 0 || kinds_of_coins == 0
    return 0
  else
    return (cc(amount, kinds_of_coins-1) + cc(amount - DENOM[kinds_of_coins], kinds_of_coins))
  end
end

def count_change(amount)
  cc(amount, 8)
end

puts count_change(200)
