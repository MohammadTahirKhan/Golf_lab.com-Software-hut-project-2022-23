class AddUserRefToHole < ActiveRecord::Migration[7.0]
  def change
    add_reference :holes , :user , foreign_key: true
    add_reference :user_holes , :user , foreign_key: true
  end
end
