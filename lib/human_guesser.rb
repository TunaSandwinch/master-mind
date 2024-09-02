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

  def guess_getter
    p 'put your guess seperated by spaces'
    self.guess = gets.chomp.upcase.split
  end

  def white_feedback
    current_index = 0
    code.each do |code_item|
      guess.each_index do |guess_index|
        if code_item == guess[guess_index]
          feedback[current_index] = 'White'
          current_index += 1
        end
      end
    end
  end

  def black_feedback
    current_index = 0
    code.each_index do |code_index|
      if code[code_index] == guess[code_index]
        feedback[current_index] = 'Black'
        current_index += 1
      end
    end
  end

  def display_feedback
    white_feedback
    black_feedback
    puts ''
    puts "| #{feedback[0]} | #{feedback[1]} | #{feedback[2]} | #{feedback[3]} |"
    puts ''
  end
end
game = HumanGuesser.new

game.guess_getter
p game.code
game.display_feedback
