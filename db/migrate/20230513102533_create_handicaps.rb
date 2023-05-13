class CreateHandicaps < ActiveRecord::Migration[7.0]
  def change
    create_table :handicaps do |t|
      t.integer :value
      t.references :user_hole, null: false, foreign_key: true

      t.timestamps
    end
  end
end
