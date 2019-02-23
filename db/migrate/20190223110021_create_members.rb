class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members, id: :uuid do |t|
      t.references :club, foreign_key: true, type: :uuid, null: false
      t.references :person, foreign_key: true, type: :uuid, null: false
      t.datetime :started_at
      t.datetime :expired_at

      t.timestamps
    end
  end
end
