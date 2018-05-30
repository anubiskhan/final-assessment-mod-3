class Api::V1::PlaysController < ApplicationController
  def create
    game = Game.find(params[:id])
    game.plays.create(user_id: params[:user_id], word: params[:word])
    render json: {
      status: 201,
      message: "Created Response",
    }.to_json
  end
end
