class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results, id: :uuid do |t|
      t.references :crew, foreign_key: true, type: :uuid, null: false
      t.references :check_point, foreign_key: true, type: :uuid, null: false
      t.float :time_s
      t.integer :position, null: false

      t.timestamps
    end
  end
end
