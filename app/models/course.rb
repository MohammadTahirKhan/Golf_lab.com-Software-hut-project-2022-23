# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  course_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord
    has_many :holes
end
