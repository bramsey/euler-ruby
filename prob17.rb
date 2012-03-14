#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the number of letters used if all the numbers from 1 to 1000 
#  (one thousand) inclusive were written out in words.

@counts = [7, 3, 3, 5, 4, 4, 3, 5, 5, 4, 3, 6, 6, 8, 8, 7, 7, 9, 8, 8, 6]
@counts[30], @counts[40], @counts[50], @counts[60], @counts[70], @counts[80], @counts[90] = 6, 5, 5, 5, 7, 6, 6

def num_letters(num)
  if num <= 0
    return 0
  elsif (num <= 20) || (num < 100 && (num % 10) == 0)
    return @counts[num]
  elsif num < 100
    tens = num % 10
    return num_letters(tens) + num_letters(num - tens)
  elsif num < 1000
    hundreds = num.to_s[0].to_i
    tens = num_letters(num - (hundreds*100))
    tens += 3 if tens > 0
    return @counts[hundreds] + @counts[0] + tens
  else
    return 11
  end
end

def sum_letters
  (1..1000).inject(0) {|sum, n| sum += num_letters(n)}
end

puts sum_letters