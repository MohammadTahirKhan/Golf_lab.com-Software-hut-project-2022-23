class CreateUserHoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_holes do |t|
      t.integer :hole_number
      t.belongs_to :hole , foreign_key: true
      t.timestamps
    end
  end
end
