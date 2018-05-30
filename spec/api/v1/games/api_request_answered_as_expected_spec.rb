require 'rails_helper'

describe 'I' do
  describe 'send a get request to /api/v1/games/1' do
    it 'returns the expected JSON' do
      get '/api/v1/games/1'

      binding.pry
    end
  end
end

  # Background: This story assumes the base data from running `rake db:seed`
  #
  # When I send a GET request to "/api/v1/games/1" I receive a JSON response as follows:
  #
  # {
  #   "game_id":1,
  #   "scores": [
  #     {
  #       "user_id":1,
  #       "score":15
  #     },
  #     {
  #       "user_id":2,
  #       "score":16
  #     }
  #   ]
