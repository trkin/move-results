class CreateMemberCrews < ActiveRecord::Migration[6.0]
  def change
    create_table :member_crews, id: :uuid do |t|
      t.references :member, foreign_key: true, type: :uuid, null: false, index: false
      t.references :crew, foreign_key: true, type: :uuid, null: false, index: false
      t.integer :position, default: 1, null: false

      t.timestamps
    end
    add_index :member_crews, [:member_id, :crew_id], unique: true
  end
end
