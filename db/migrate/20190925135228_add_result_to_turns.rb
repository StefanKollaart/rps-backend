class AddResultToTurns < ActiveRecord::Migration[5.2]
  def change
    add_column :turns, :winner_id, :integer
    add_column :turns, :is_draw, :boolean, default: false
  end
end
