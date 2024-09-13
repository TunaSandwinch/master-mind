# frozen_string_literal: true

require_relative 'game'
# AI to play with a human player
class CommputerGuesser
  attr_accessor :code, :computer_guess, :remaining_colors, :feedback

  def initialize
    @code = ''
    @feedback = ''
    @computer_guess = %w[R O Y G B V].sample(4)
    @remaining_colors = %w[R O Y G B V] - computer_guess
  end

  def obtain_code
    puts 'Type in your desired code:'
    puts '| R | O | Y | G | B | V |'
    self.code = gets.chomp.upcase.split
  end

  def obtain_feedback
    puts 'Type in your feedback:'
    self.feedback = gets.chomp.upcase.split
  end
end
