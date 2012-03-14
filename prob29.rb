#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the number of distinct terms in the sequence generated 
#  by a^b for 2 <= a <= 100 and 2 <= b <= 100

def solve(max)
  vals = []
  
  2.upto(max) {|a| 2.upto(max) {|b| vals << a**b}}
  
  vals.sort.uniq.length
  
end

puts solve(100)