class DropCourses < ActiveRecord::Migration[7.0]
  def change
    remove_column :holes, :course_id
    drop_table :courses
    add_column :holes, :course_name, :string
  end
end
