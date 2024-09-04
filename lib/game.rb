# frozen_string_literal: true

# methods to play the game goes here
class PlayGame
  attr_accessor :colors, :code

  def initialize
    @colors = %w[R O Y G B V]
    @code = []
  end

  def self.choose_guesser
    puts 'would you like to be the guesser? Y/N'
    gets.chomp
  end

  def generate_code
    random_num = rand(0..5)
    if code.length < 4
      code << colors[random_num]
      code.uniq!
      generate_code
    else
      code
    end
  end
end
