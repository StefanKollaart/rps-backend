class RemovePickedAndPlayerFromTurns < ActiveRecord::Migration[5.2]
  def change
    remove_column :turns, :player_id
    remove_column :turns, :picked
  end
end
