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

  def white_feedback
    count = 0
    code.each do |code_item|
      guess.each do |guess_item|
        count += 1 if code_item == guess_item
      end
    end
    count
  end
end
