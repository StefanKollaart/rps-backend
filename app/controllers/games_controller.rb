class GamesController < ApplicationController
  def match_or_create
    @game = Game.match_or_create(params[:player_id])

    render json: @game.as_json(include: [game_players: {}, players: {}, turns: { include: { picks: {} } }])
  end

  def play_options
    render json: Game.play_options
  end
end
