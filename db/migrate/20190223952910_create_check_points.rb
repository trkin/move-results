class CreateCheckPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :check_points, id: :uuid do |t|
      t.references :discipline, foreign_key: true, type: :uuid, null: false
      t.integer :distance_m
      t.integer :position, default: 0, null: false
      t.boolean :final, default: true, null: false

      t.timestamps
    end
  end
end
