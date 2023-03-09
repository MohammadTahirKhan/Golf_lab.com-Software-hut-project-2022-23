class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_reference :holes , :user , foreign_key: true 
    add_reference :holes , :course , foreign_key: true

    add_reference :user_holes , :hole , foreign_key: true 
    add_reference :user_holes , :user , foreign_key: true 

    add_reference :data , :hole , foreign_key: true 
    add_reference :data , :user_hole , foreign_key: true 

  end
end
