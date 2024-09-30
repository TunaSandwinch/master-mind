# frozen_string_literal: true

require_relative 'game'
# AI to play with a human player
class ComputerGuesser
  attr_accessor :code, :computer_guess, :remaining_colors, :feedback, :color_pool

  def initialize
    @code = ''
    @feedback = ''
    @color_pool = %w[R O Y G B V]
    @computer_guess = color_pool.sample(4)
    @remaining_colors = color_pool - computer_guess
  end

  def code_cracked?
    return true if computer_guess == code

    false
  end

  def display_computer_guess
    p "| #{computer_guess[0]} | #{computer_guess[1]} | #{computer_guess[2]} | #{computer_guess[3]} |"
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

  def white_feedback_count
    feedback.count { |item| item == 'W' || item == 'B' } # rubocop:disable Style/MultipleComparison
  end

  def black_feedback_count
    feedback.count { |item| item == 'B' }
  end

  def two_right_colors?(turns) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    prev_guess = computer_guess.dup
    # prev_remaining_colors = remaining_colors.dup

    if white_feedback_count == 2
      computer_guess[0] = remaining_colors[0]
      computer_guess[1] = remaining_colors[1]
      self.remaining_colors = color_pool - computer_guess
      true
    elsif turns == 1
      computer_guess[-1] = remaining_colors[0]
      remaining_colors[0] = prev_guess[-1]
      false
    elsif turns == 2
      computer_guess[0] = prev_guess[-1]
      computer_guess[1] = remaining_colors[0]
      computer_guess[2] = prev_guess[0]
      computer_guess[3] = prev_guess[1]
      true
    else
      true
    end
  end
end

game = ComputerGuesser.new
turns = 1
game.obtain_code
game.display_computer_guess
game.obtain_feedback
while turns <= 12
  break if game.two_right_colors?(turns)

  game.display_computer_guess
  game.obtain_feedback
  turns += 1
end
puts turns
game.display_computer_guess
