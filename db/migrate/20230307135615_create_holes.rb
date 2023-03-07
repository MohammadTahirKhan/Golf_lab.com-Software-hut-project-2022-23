class CreateHoles < ActiveRecord::Migration[7.0]
  def change
    create_table :holes do |t|
      t.integer :hole_number
      t.boolean :is_being_edited
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
