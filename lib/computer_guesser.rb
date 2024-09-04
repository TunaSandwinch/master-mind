# frozen_string_literal: true

require_relative 'game'
# AI to play with a human player
class ComputerGuesser < PlayGame
  def initialize
    super
    @code = ''
    @remaining_colors = %w[R O Y G B V]
  end
end
