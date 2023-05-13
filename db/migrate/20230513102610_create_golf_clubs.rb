class CreateGolfClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :golf_clubs do |t|
      t.string :name
      t.string :manufacturer
      t.string :club_type
      t.references :user_hole, null: false, foreign_key: true

      t.timestamps
    end
  end
end
