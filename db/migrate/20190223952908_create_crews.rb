class CreateCrews < ActiveRecord::Migration[6.0]
  def change
    create_table :crews, id: :uuid do |t|
      t.references :race, foreign_key: true, type: :uuid, null: false
      t.integer :lane
      t.integer :relay

      t.timestamps
    end
  end
end
