class StopTurnJob < ApplicationJob
  queue_as :default

  def perform(turn)
    turn.active = false
    turn.calculate_results
    if turn.save(validate: false)
      game = turn.game
      ActionCable.server.broadcast("game_#{game.id}_channel", game.as_json(include: [game_players: {}, players: {}, turns: { include: { picks: {} } }]))
      StartNewTurnJob.set(wait: 5.seconds).perform_later(turn.game)
    end
  end
end
