#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, 
#  contain the same digits.
#
#  Observation:
#    Only numbers from 1XX to 166 can have be multiplied by 6 and 
#    have the same number of digits.


def same_digits?(a, b)
  a_sort = a.split(//).sort.join
  b_sort = b.split(//).sort.join
  a_sort == b_sort
end

def special?(num)
  2.upto(6) do |m|
    same = same_digits?(num.to_s, (num*m).to_s)
    return false unless same
  end
  return true
end

def find_num
  mult = 10
  while(mult < 100000000)
    upper_bound = mult*10
    mult.upto(upper_bound/6) {|n| return n if special?(n) }
    mult = upper_bound
  end
  false
end

puts find_num

