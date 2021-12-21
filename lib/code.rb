require 'byebug'

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |c| POSSIBLE_PEGS.keys.include?(c.upcase) }
  end

  def self.random(length)
    random = []

    length.times { random << POSSIBLE_PEGS.keys.sample}

    Code.new(random)
  end

  def self.from_string(string)
    array =string.split('')

    Code.new(array)

  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise 'chars invalid'
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)

    matches = 0

    count = 0

    while count < code.length
      # debugger
      if code[count] == @pegs[count]
        matches += 1
      end
      count +=1
    end
    matches
  end

  def num_near_matches(guess)
    (0...guess.length).count do |i|
      guess_peg = guess[i]
      @pegs.include?(guess_peg) && guess_peg != @pegs[i]
    end
  end

  def ==(code)
    @pegs == code.pegs
  end

  

end
