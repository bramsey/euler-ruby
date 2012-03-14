#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the maximum total from top to bottom in triangle.txt.

class Leaf
  attr_accessor :i, :j, :val, :max
  
  def initialize(i, j, val)
    @i, @j, @val = i, j, val.to_i
  end
end

def build_tree
  infile = File.open('triangle.txt')
  
  tree = []
  
  infile.each {|line| tree << line.split(' ')}

  0.upto(tree.length-1) do |i|
    0.upto(tree[i].length-1) do |j|
      tree[i][j] = Leaf.new(i, j, tree[i][j].to_i)
    end
  end
  
  return tree
end

@tree = build_tree

def max_chain(leaf)
  if leaf.i == (@tree.length-1)
    return leaf.val
  else
    return leaf.max ||= (leaf.val + [max_chain(@tree[leaf.i+1][leaf.j]), 
                         max_chain(@tree[leaf.i+1][leaf.j+1])].max)
  end
end

puts max_chain(@tree[0][0])