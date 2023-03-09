class RemoveColoumns < ActiveRecord::Migration[7.0]
  def change
    remove_column(:holes, :user_id)
    remove_column(:holes, :course_id)
    remove_column(:data, :hole_id)
    remove_column(:data, :userhole_id)
    remove_column(:user_holes, :user_id)
    remove_column(:user_holes, :hole_id)



  end
end
