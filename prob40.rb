#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# problem: http://projecteuler.net/problem=40

def brute
  str = '0'
  1.upto(1000000) {|i| str += i.to_s}
  
  prod = 1
  mult = 1
  
  while mult <= 1000000
    prod *= str[mult].to_i
    mult *= 10
  end
  
  prod
end


# start of optimization:

#1 * 1 * 5 * 3 * 7 * 2
def solve
  str = ''
  mult = 1
  prod = 1
  count = 0
  1.upto(189555) do |i|
    #str += i.to_s
    if i > 100000
      count += 6
    elsif i > 10000 && i <= 100000
      count += 5
    elsif i > 1000 && i <= 10000
      count += 4
    elsif i > 100 && i <= 1000
      count += 3
    elsif i > 10 && i <= 100
      count += 2
    else
      count += 1
    end
    puts "#{i}: #{count}"
    if count >= mult
      prod *= i
      puts "#{mult}: #{prod} | #{i} | #{count}" 
      #mult *= 10
    end
  end
  prod
end

puts brute
#puts solve