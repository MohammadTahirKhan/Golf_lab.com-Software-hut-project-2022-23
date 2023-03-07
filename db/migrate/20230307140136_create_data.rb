class CreateData < ActiveRecord::Migration[7.0]
  def change
    create_table :data do |t|
      t.string :x_coordinates
      t.string :y_coordinates
#add enum here
      t.integer :hole_id
      t.integer :user_hole_id

      t.timestamps
    end
  end
end
