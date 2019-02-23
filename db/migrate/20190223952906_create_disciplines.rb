class CreateDisciplines < ActiveRecord::Migration[6.0]
  def change
    create_table :disciplines, id: :uuid do |t|
      t.references :activity, foreign_key: true, type: :uuid, null: false
      t.references :event, foreign_key: true, type: :uuid, null: false
      t.jsonb :name, default: {}
      t.integer :distance_m
      t.integer :age_min
      t.integer :age_max
      t.integer :number_of_crew, default: 1, null: false
      t.integer :number_of_relays, default: 1, null: false
      t.integer :gender, default: 0, null: false

      t.timestamps
    end
  end
end
