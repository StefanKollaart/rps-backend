class Player < ApplicationRecord
  has_many :game_players, dependent: :destroy
  has_many :games, through: :game_players
  has_many :picks, dependent: :destroy
end
