require 'rails_helper'

describe 'I' do
  describe 'send a get request to /api/v1/games/1' do
    it 'returns the expected JSON' do
      Game.delete_all
      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      game = Game.create(id: 1, player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)

      get '/api/v1/games/1'

      expect(response.body).to eq("{\"game_id\":1,\"scores\":[{\"user_id\":1,\"score\":15},{\"user_id\":2,\"score\":15}]}")
    end
  end
end
