class CreateDisciplineHappenings < ActiveRecord::Migration[6.0]
  def change
    create_table :discipline_happenings, id: :uuid do |t|
      t.references :discipline, foreign_key: true, null: false, type: :uuid
      t.references :happening, foreign_key: true, null: false, type: :uuid
      t.references :result_sampling, foreign_key: true, type: :uuid
      t.jsonb :name, default: {}
      t.integer :gender, default: 0, null: false
      t.integer :distance_m
      t.integer :age_min
      t.integer :age_max
      t.datetime :start_time

      t.timestamps
    end
  end
end
