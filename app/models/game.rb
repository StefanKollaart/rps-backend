class Game < ApplicationRecord
  has_many :game_players, dependent: :destroy
  has_many :players, through: :game_players
  has_many :turns, dependent: :destroy

  def self.match_or_create(player_id)
    games = Game.where(created_at: (Time.now - 5.minutes)..Time.now)
    games_that_need_players = games.select { |game| game.players.count == 1 }
    if games_that_need_players.count == 0
      new_game = Game.create!
      GamePlayer.create!(game_id: new_game.id, player_id: player_id)
      new_game
    else
      join_game = games_that_need_players.sample
      GamePlayer.create!(game_id: join_game.id, player_id: player_id)
      Turn.create!(game_id: join_game.id)
      join_game
    end
  end

  def self.play_options
    [
      {
        id: 1,
        name: "Rock",
        emoji: '✊'
      },
      {
        id: 2,
        name: "Paper",
        emoji: '✋'
      },
      {
        id: 3,
        name: "Scissors",
        emoji: '✌️'
      }
    ]
  end
end
