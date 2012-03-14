#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the largest palindrome made from the product of two 3-digit numbers.

def palindrome?( num )
  num.to_s == num.to_s.reverse
end

def top_palindrome
  max = 0
  999.downto(100) do |i|
    999.downto(100) do |j|
      product = i * j
      max = product if palindrome?( product ) && product > max 
    end
  end
  max
end

puts top_palindrome

