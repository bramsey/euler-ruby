#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the total of all the name scores in names.txt.

ALPHA = %{0ABCDEFGHIJKLMNOPQRSTUVWXYZ}

def build_names
  infile = File.open('names.txt')
  
  names = []
  infile.each {|line| names =  line.split(',')}
  names.sort
end

names = build_names

name_scores = []

def score_for(name, index)
  sum = name.chars.inject(0) {|sum, char| sum += ALPHA.index(char)}
  sum * index
end

names.each_index do |i|
  name_scores << score_for(names[i], i+1)
end

puts name_scores.inject(:+)