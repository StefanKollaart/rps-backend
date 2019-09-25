class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.references :player, foreign_key: true
      t.references :turn, foreign_key: true
      t.integer :picked

      t.timestamps
    end
  end
end
