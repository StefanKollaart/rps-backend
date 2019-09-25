class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:game_id]}_channel"
  end

  def unsubscribed
    game = Game.find(params[:game_id])
    game.destroy!
  end

  def create(opts)
    Turn.create!(player_id: opts.fetch('player_id'), game_id: opts.fetch('game_id'))
  end
end
