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

  def two_right_colors?(turns) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    prev_guess = computer_guess.dup
    prev_remaining_colors = remaining_colors.dup
    if white_feedback_count == 2
      computer_guess[0] = prev_remaining_colors[0]
      computer_guess[1] = prev_remaining_colors[1]
      self.remaining_colors = color_pool - computer_guess

      return true
    elsif turns == 11
      computer_guess[-1] = prev_remaining_colors[0]
      self.remaining_colors = color_pool - computer_guess
    else
      computer_guess[0] = prev_guess[-1]
      computer_guess[1] = prev_remaining_colors[0]
      computer_guess[2] = prev_guess[0]
      computer_guess[3] = prev_guess[1]
      self.remaining_colors = color_pool - computer_guess

      return true
    end
    false
  end
end

game = ComputerGuesser.new
turns = 11
game.obtain_code
p game.computer_guess
game.obtain_feedback

while turns.positive?
  game.two_right_colors?(turns)
  game.display_computer_guess
  puts "remaining colors: #{game.remaining_colors}"
  game.obtain_feedback
  turns -= 1
end
