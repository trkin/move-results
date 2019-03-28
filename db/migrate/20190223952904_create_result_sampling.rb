class CreateResultSampling < ActiveRecord::Migration[6.0]
  def change
    create_table :result_samplings, id: :uuid do |t|
      t.references :happening, foreign_key: true, type: :uuid, null: false
      t.jsonb :name, default: {}

      t.timestamps
    end
  end
end
