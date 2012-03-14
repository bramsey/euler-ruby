#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the greatest product of four adjacent numbers in any direction
#  (up, down, left, right, or diagonally) in the 2020 grid.

infile = File.open("grid.txt")
@grid = []
infile.each {|line| @grid << line.split(' ').collect {|i| i.to_i}}

def highest_sum_right_adjacents
  max = 0
  max_adjacents = []
  (0..19).each do |i|
    (0..16).each do |j|
      curr = @grid[i][j] + @grid[i][j+1] + @grid[i][j+2] + @grid[i][j+3]
      if curr > max
        max = curr
        max_adjacents = [@grid[i][j], @grid[i][j+1], @grid[i][j+2], @grid[i][j+3]]
      end
    end
  end
  return max, max_adjacents
end

def highest_sum_down_adjacents
  max = 0
  max_adjacents = []
  (0..16).each do |i|
    (0..19).each do |j|
      curr = @grid[i][j] + @grid[i+1][j] + @grid[i+2][j] + @grid[i+3][j]
      if curr > max
        max = curr
        max_adjacents = [@grid[i][j], @grid[i+1][j], @grid[i+2][j], @grid[i+3][j]]
      end
    end
  end
  return max, max_adjacents
end

def highest_sum_diagonal_right_adjacents
  max = 0
  max_adjacents = []
  (0..16).each do |i|
    (0..16).each do |j|
      curr = @grid[i][j] + @grid[i+1][j+1] + @grid[i+2][j+2] + @grid[i+3][j+3]
      if curr > max
        max = curr
        max_adjacents = [@grid[i][j], @grid[i+1][j+1], @grid[i+1][j+2], @grid[i+1][j+3]]
      end
    end
  end
  return max, max_adjacents
end

def highest_sum_diagonal_left_adjacents
  max = 0
  max_adjacents = []
  (3..19).each do |i|
    (0..16).each do |j|
      curr = @grid[i][j] + @grid[i-1][j+1] + @grid[i-2][j+2] + @grid[i-3][j+3]
      if curr > max
        max = curr
        max_adjacents = [@grid[i][j], @grid[i-1][j+1], @grid[i-2][j+2], @grid[i-3][j+3]]
      end
    end
  end
  return max, max_adjacents
end

def greatest_product
  results = [highest_sum_right_adjacents, highest_sum_down_adjacents, 
             highest_sum_diagonal_right_adjacents, highest_sum_diagonal_left_adjacents]
  product = 1
  results.max[1].each {|num| product *= num}
  product 
end

puts greatest_product