class Pick < ApplicationRecord
  belongs_to :player
  belongs_to :turn

  def self.set_or_edit(player_id, turn_id, picked)
    active_turn = Turn.find(turn_id)
    if active_turn.active
      begin
        already_pick = Pick.find_by(player_id: player_id, turn_id: turn_id)
        already_pick.picked = picked
        already_pick.save
      rescue
        Pick.create!(player_id: player_id, turn_id: turn_id, picked: picked)
      end
    end
  end
end
