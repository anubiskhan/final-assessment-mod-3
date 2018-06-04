class Api::V1::GamesController < ApiController
  def show
    @game = Game.find(params[:id])
    render json: @game.game_stats.to_json
  end
end
