class CreateHoles < ActiveRecord::Migration[7.0]
  def change
    create_table :holes do |t|
      t.integer :hole_number
      t.boolean :is_being_edited
      t.belongs_to :course , foreign_key: true

      t.timestamps
    end
  end
end
