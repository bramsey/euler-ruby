#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the millionth lexographic permutation of the digits 0123456789.

# Calculate factorial
def fact(n)
  n.downto(1).inject(:*)
end

# recursively find the nth permutation of the specified string
# through factorial reduction.
def nth_perm(str, max)
  n = str.length - 1
  return str if n  == 0
  i = 0
  fac = fact(n)
  i += 1 while ((i+1)*fac) < max && i < n
  str[i] + nth_perm(str.tr(str[i], ''), max - (i*fac))
end

puts nth_perm('0123456789', 1000000)
