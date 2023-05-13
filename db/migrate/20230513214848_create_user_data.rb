class CreateUserData < ActiveRecord::Migration[7.0]
  def change
    create_table :user_data do |t|
      t.references :user_hole, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
