class AddActiveToTurns < ActiveRecord::Migration[5.2]
  def change
    add_column :turns, :active, :boolean, default: true
  end
end
