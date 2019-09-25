class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.references :game, foreign_key: true
      t.integer :picked
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
