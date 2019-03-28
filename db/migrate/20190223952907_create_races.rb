class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races, id: :uuid do |t|
      t.references :discipline_happening, foreign_key: true, type: :uuid, null: false
      t.integer :category, default: 0, null: false
      t.datetime :started_at

      t.timestamps
    end
  end
end
