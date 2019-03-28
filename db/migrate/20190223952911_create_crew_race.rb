class CreateCrewRace < ActiveRecord::Migration[6.0]
  def change
    create_table :crew_races, id: :uuid do |t|
      t.references :crew, foreign_key: true, type: :uuid, null: false
      t.references :race, foreign_key: true, type: :uuid, null: false
      t.integer :lane
      t.integer :relay

      t.timestamps
    end
  end
end
