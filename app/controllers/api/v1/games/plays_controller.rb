class Api::V1::Games::PlaysController < ApiController
  def create
    game = Game.find(params[:game_id])
    game.plays.create(user_id: params[:user_id], word: params[:word])
    render json: {
      status: 201,
      message: "Created Response",
    }.to_json
  end
end
