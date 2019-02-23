class CreateMemberCrews < ActiveRecord::Migration[6.0]
  def change
    create_table :member_crews, id: :uuid do |t|
      t.references :member, foreign_key: true, type: :uuid, null: false
      t.references :crew, foreign_key: true, type: :uuid, null: false
      t.integer :position, default: 1, null: false

      t.timestamps
    end
  end
end
