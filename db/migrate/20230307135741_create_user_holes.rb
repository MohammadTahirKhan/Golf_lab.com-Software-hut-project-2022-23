class CreateUserHoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_holes do |t|
      t.integer :hole_number
      t.integer :user_id
      t.integer :hole_id

      t.timestamps
    end
  end
end
