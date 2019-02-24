class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities, id: :uuid do |t|
      t.jsonb :name, default: {}
      t.jsonb :description, default: {}
      t.string :icon_name

      t.timestamps
    end
  end
end
