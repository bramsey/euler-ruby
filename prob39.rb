#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# If p is the perimeter of a right angle triangle with integral length sides, 
# {a,b,c}, there are exactly three solutions for p = 120.
#
# {20,48,52}, {24,45,51}, {30,40,50}
#
# For which value of p <= 1000, is the number of solutions maximised?

# Conjecture:
#  120 has a lot of solutions, so perhaps the largest multiple of 120
#  that satisfies the conditions is the answer.

def solutions(p)
  sols = []
  t = 2*(p/3)
  
  1.upto(t-3) do |a|
    (a+1).upto(t-2) do |b|
      (b+1).upto(t-1) do |c|
        sols << [a, b, c] if a+b+c == p && (a**2 + b**2) == c**2
      end
    end
  end
  sols
end

def solve
  max = 924
  max_sol = 5
  
  (924).downto(240) do |n|
    if n % 2 == 0 || n % 5 == 0
      sols = solutions(n).length
      puts "#{n}: #{sols}"
      if sols > max_sol
        max = n
        max_sol = sols
        print 'max'
      end
    end
  end
  
  max
end

puts solutions(840).length