require 'rails_helper'

FactoryBot.define do
  factory :create_datum do
    xCoordinates { "MyString" }
    yCoordinates { "MyString" }
    hole_id { 1 }
    userhole_id { 1 }
    hole { build(:hole) }
    user_hole { build(:user_hole_with_user_and_course_and_user_course) }
  end
end
