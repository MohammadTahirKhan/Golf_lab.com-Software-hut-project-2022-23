# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :course do
    name { "MyString" }
  end

  factory :course_with_holes, class: Course do
    name { "MyString" }
    holes { [build(:hole)] }
  end

  factory :course_with_holes_and_users, class: Course do
    name { "MyString" }
    holes { [build(:hole)] }
    users { [build(:user)] }
  end

  factory :course_with_holes_and_users_and_user_holes, class: Course do
    name { "MyString" }
    holes { [build(:hole)] }
    users { [build(:user)] }
    user_holes { [build(:user_hole)] }
  end

  factory :course_with_holes_and_users_and_user_holes_and_data, class: Course do
    name { "MyString" }
    holes { [build(:hole)] }
    users { [build(:user)] }
    user_holes { [build(:user_hole)] }
    data { [build(:datum)] }
  end
end
