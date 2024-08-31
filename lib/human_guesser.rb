# frozen_string_literal: true

require_relative 'game'

# methods to use if the user choose to guess the code
class HumanGuesser < PlayGame
  attr_accessor :guess, :feedback

  def initialize
    super
    @feedback = 'none'
    @guess = 'none'
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
end

player = HumanGuesser.new
player.generate_code
player.guess_getter
p player.code
p player.white_feedback
