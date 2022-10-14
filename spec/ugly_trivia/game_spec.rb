require './spec/spec_helper'
require './lib/ugly_trivia/game'

def run_game(game, seq, wrong_answer_trigger)
  game.add('Chet')
  game.add('Pat')
  game.add('Sue')

  index = 0

  begin
    game.roll(seq[index])

    if seq[index] == wrong_answer_trigger
      not_a_winner = game.wrong_answer
    else
      not_a_winner = game.was_correctly_answered
    end

    index += 1
  end while not_a_winner
end

describe UglyTrivia::Game do
  let!(:game) { UglyTrivia::Game.new }

  it 'zero to nine sequence' do
    seq = [6,9,2,4,7,0,5,1,0,2,8,4,2,3,8,1,2,5,1,7,8,4,5,7,8,1,3,1,9,2,9,6,2,2,1,0,2,6,1,2,8,9,7,1,3,5,2,5,1,3]

    run_game(game, seq, 7)

    verify { game.get_output }
  end

  it 'one to six sequence' do
    seq = [6,6,6,1,3,1,6,4,1,2,4,6,1,2,3,4,2,3,1,1,6,1,6,6,3,4,6,4,4,2,6,4,2,5,5,4,6,4,1,6,5,5,5,5,1,2,3,3,4,4]

    run_game(game, seq, 3)

    verify { game.get_output }
  end
end
