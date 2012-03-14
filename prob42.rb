#!/Users/spamram/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

# Goal:
#  Find the number of triangle words in the text file.

@score_counts = []
@max_score = 0
ALPHA = %{0ABCDEFGHIJKLMNOPQRSTUVWXYZ}


def calc_score(word)
  score = word.chars.inject(0) {|result, ele| result += ALPHA.index(ele)}
end


def pop_scores
  words = []
  infile = File.open('words.txt')
  infile.each {|line| words =  line.split(',')}
  words.each do |word|
    score = calc_score(word.strip)
    if @score_counts[score]
      @score_counts[score] += 1
    else
      @score_counts[score] = 1
    end
    @max_score = score if score > @max_score
  end
end

def triangles
  pop_scores
  @score_counts.each_index {|i| @score_counts[i] ||= 0}
  count = 0
  n= 1
  t = 0
  while t <= @max_score
    t = (n*(n+1))/2
    if t <= @max_score
      scount = @score_counts[t]
      count += scount
    end
    n += 1
  end
  count
end

puts triangles
    

