# frozen_string_literal: true

require_relative 'game'

# methods to use if the user choose to guess the code
class HumanGuesser < PlayGame
  attr_accessor :guess, :feedback

  def initialize
    super
    @guess = 'none'
    @feedback = %w[None None None None]
  end

  def obtain_guess
    puts 'take your guess!'
    puts ''
    puts '| R | O | Y | G | B | V |'
    puts ''
    puts 'put your guess seperated by spaces :'
    self.guess = gets.chomp.upcase.split
  end

  def white_feedback
    current_index = 0
    code.each do |code_item|
      guess.each_index do |guess_index|
        next unless code_item == guess[guess_index]

        feedback[current_index] = 'White'
        current_index += 1
      end
    end
  end

  def black_feedback
    current_index = 0
    code.each_index do |code_index|
      next unless code[code_index] == guess[code_index]

      feedback[current_index] = 'Black'
      current_index += 1
    end
  end

  def display_feedback
    white_feedback
    black_feedback
    puts ''
    puts "| #{feedback[0]} | #{feedback[1]} | #{feedback[2]} | #{feedback[3]} |"
    puts ''
    self.feedback = %w[None None None None]
  end

  def display_guess
    puts "| #{guess[0]} | #{guess[1]} | #{guess[2]} | #{guess[3]} |"
  end

  def code_cracked?
    return true if guess == code

    false
  end
end
