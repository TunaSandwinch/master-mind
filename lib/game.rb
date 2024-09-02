# frozen_string_literal: true

# methods to play the game goes here
class PlayGame
  attr_accessor :colors, :code

  def initialize
    @colors = %w[R O Y G B V]
    @code = %w[R O Y G]
  end

  def self.choose_guesser
    puts 'would you like to be the guesser? Y/N'
    gets.chomp
  end
end
