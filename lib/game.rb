# frozen_string_literal: true

# methods to play the game goes here
class PlayGame
  attr_accessor :colors, :code

  def initialize
    @colors = %w[R O Y G B V]
    @code = []
  end

  def choose_guesser
    gets.chomp
  end
end
