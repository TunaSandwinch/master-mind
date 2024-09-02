# frozen_string_literal: true

require_relative 'lib/human_guesser'
require_relative 'lib/game'

def play_as_guesser(turns)
  game = HumanGuesser.new
  p "turns left : #{turns}"
  while turns.positive?
    game.generate_code
    game.obtain_guess
  end
end
