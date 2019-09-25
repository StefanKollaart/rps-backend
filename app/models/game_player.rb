class GamePlayer < ApplicationRecord
  belongs_to :player
  belongs_to :game

  after_create_commit do
    GameBroadcastJob.perform_later(self.game)
  end
end
