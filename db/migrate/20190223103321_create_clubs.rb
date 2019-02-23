class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs, id: :uuid do |t|
      t.jsonb :name, default: {}
      t.references :venue, foreign_key: true, type: :uuid
      t.string :website
      t.string :email
      t.string :phone
      t.boolean :personal, default: false, null: false
      t.string :national_id

      t.timestamps
    end
  end
end
