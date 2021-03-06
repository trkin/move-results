class CreateCrews < ActiveRecord::Migration[6.0]
  def change
    create_table :crews, id: :uuid do |t|
      t.references :discipline_happening, foreign_key: true, type: :uuid, null: false
      t.references :club, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
