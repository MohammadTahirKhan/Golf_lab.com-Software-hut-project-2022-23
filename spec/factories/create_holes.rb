FactoryBot.define do
  factory :create_hole do
    course_name { "MyString" }
    hole_number { 1 }
    is_beingEdited { false }
    user { nil }
    data { [build(:datum)] }
    user_holes { [build(:user_hole)] }
  end
end
