# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  course_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :course do
    course_name { "MyString" }
  end
end
