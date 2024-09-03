# frozen_string_literal: true

require_relative 'lib/human_guesser'
require_relative 'lib/game'

def play_as_guesser(turns) # rubocop:disable Metrics/MethodLength
  game = HumanGuesser.new
  lives = turns
  game.generate_code
  while lives.positive?
    puts "turns left : #{lives}"
    p game.code
    puts ''
    game.obtain_guess
    game.display_guess
    game.display_feedback
    if game.code_cracked?
      puts 'You win!, You cracked the code!'
      break
    elsif lives == 1
      puts 'You lose! you ran out of turns!'
    end
    lives -= 1
  end
end

if PlayGame.choose_guesser.upcase == 'Y'
  play_as_guesser(12)
else
  puts 'Hello world!'
end
