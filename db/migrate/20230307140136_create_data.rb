class CreateData < ActiveRecord::Migration[7.0]
  def change
    create_table :data do |t|
      t.string :x_coordinates
      t.string :y_coordinates     
      t.belongs_to :hole , foreign_key: true
      t.belongs_to :user_hole , foreign_key: true
      t.timestamps
    end
  end
end
