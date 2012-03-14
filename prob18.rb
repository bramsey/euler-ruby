#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the maximum total from top to bottom of the triangle.


class Leaf
  attr_accessor :i, :j, :val, :max
  
  def initialize(i, j, val)
    @i, @j, @val = i, j, val.to_i
  end
  
  def self.max(a, b)
    a.val > b.val ? a : b
  end
end

def build_tree
  raw = %{75
  95 64
  17 47 82
  18 35 87 10
  20 04 82 47 65
  19 01 23 75 03 34
  88 02 77 73 07 63 67
  99 65 04 28 06 16 70 92
  41 41 26 56 83 40 80 70 33
  41 48 72 33 47 32 37 16 94 29
  53 71 44 65 25 43 91 52 97 51 14
  70 11 33 28 77 73 17 78 39 68 17 57
  91 71 52 38 17 14 91 43 58 50 27 29 48
  63 66 04 68 89 53 67 30 73 16 69 87 40 31
  04 62 98 27 23 09 70 98 73 93 38 53 60 04 23}

  tree = raw.split(/\n/).collect {|row| row.split(' ')}

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
    return leaf.max ||= (leaf.val + [max_chain(@tree[leaf.i+1][leaf.j]), max_chain(@tree[leaf.i+1][leaf.j+1])].max)
  end
end

puts max_chain(@tree[0][0])
