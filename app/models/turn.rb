class Turn < ApplicationRecord
  belongs_to :game
  has_many :picks, dependent: :destroy

  def calculate_results
    pick_numbers = []
    picks.each do |pick|
      pick_numbers << pick.picked
    end
    if pick_numbers[0] == pick_numbers[1]
      self.is_draw = true
      game.game_players.each do |g_p|
        g_p.score += 1
        g_p.save
      end
    elsif (pick_numbers[0] == 1 && pick_numbers[1] == 3) || (pick_numbers[0] == 2 && pick_numbers[1] == 1) || (pick_numbers[0] == 3 && pick_numbers[1] == 2)
      self.winner_id = picks[0].player.id
      g_p = game.game_players.find_by(player_id: self.winner_id)
      g_p.score += 1
      g_p.save
    else
      self.winner_id = picks[1].player.id
      g_p = game.game_players.find_by(player_id: self.winner_id)
      g_p.score += 1
      g_p.save
    end
  end

  after_create_commit do
    GameBroadcastJob.perform_later(self.game)
    StopTurnJob.set(wait: 15.seconds).perform_later(self)
  end
end
