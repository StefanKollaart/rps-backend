class GameBroadcastJob < ApplicationJob
  queue_as :default

  def perform(game)
    ActionCable.server.broadcast("game_#{game.id}_channel", game.as_json(include: [game_players: {}, players: {}, turns: { include: { picks: {} } }]))
  end
end
