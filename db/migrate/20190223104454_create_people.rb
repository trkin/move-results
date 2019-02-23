class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people, id: :uuid do |t|
      t.jsonb :name, default: {}
      t.integer :birth_year
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
