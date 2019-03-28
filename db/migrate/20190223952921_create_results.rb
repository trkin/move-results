class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results, id: :uuid do |t|
      t.references :crew_race, foreign_key: true, type: :uuid, null: false, index: false
      t.references :check_point, foreign_key: true, type: :uuid, index: false
      t.float :time_s
      t.integer :position, null: false

      t.timestamps
    end
    add_index :results, [:crew_race_id, :check_point_id], unique: true
  end
end
