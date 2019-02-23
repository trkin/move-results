class CreateActivityAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_associations, id: :uuid do |t|
      t.references :activity, foreign_key: true, type: :uuid, null: false
      t.references :associated_activity, foreign_key: { to_table: :activities }, type: :uuid, null: false
      t.integer :category, default: 0, null: false

      t.timestamps
    end
  end
end
