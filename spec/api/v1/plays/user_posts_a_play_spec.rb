require 'rails_helper'

describe 'user' do
  describe 'posts a play' do
    it 'counts the play and adjusts the game' do
      Game.delete_all
      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      game = Game.create(id: 1, player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)

      post "/api/v1/games/1/plays?user_id=1&word=at"

      expect(response.body).to include('201')
      expect(response.body).to include('Created Response')

      get '/api/v1/games/1'

      expect(response.body).to eq("{\"game_id\":1,\"scores\":[{\"user_id\":1,\"score\":17},{\"user_id\":2,\"score\":16}]}")
    end
  end
end

#
# Background: This story assumes the base data from running `rake db:seed`
#
# You can choose to send the user_id and word specified below however you'd like or are comfortable.
#
# When I send a POST request to "/api/v1/games/1/plays" with a user_id=1 and word=at
# Then I should receive a 201 Created Response
#
# When I send a GET request to "/api/v1/games/1" I receive a JSON response as follows:
#
# {
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":17
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }
