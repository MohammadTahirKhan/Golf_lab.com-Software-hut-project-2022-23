class CreateData < ActiveRecord::Migration[7.0]
  def change
    create_table :data do |t|
      t.string :xCoordinates
      t.string :yCoordinates
      t.integer :hole_id
      t.integer :userhole_id

      t.timestamps
    end
  end
end
