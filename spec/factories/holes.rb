# == Schema Information
#
# Table name: holes
#
#  id             :bigint           not null, primary key
#  course_name    :string
#  hole_number    :integer
#  is_beingEdited :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint
#
# Indexes
#
#  index_holes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :hole do
    course_name { "MyString" }
    hole_number { 1 }
    is_beingEdited { false }
    user { nil }
  end
  
  factory :hole_with_data, class: Hole do
    course_name { "MyString" }
    hole_number { 1 }
    is_beingEdited { false }
    user { nil }
    data { [build(:datum)] }
  end

  factory :hole_with_user_holes, class: Hole do
    course_name { "MyString" }
    hole_number { 1 }
    is_beingEdited { false }
    user { nil }
    user_holes { [build(:user_hole)] }
  end

  factory :hole_with_data_and_user_holes, class: Hole do
    course_name { "MyString" }
    hole_number { 1 }
    is_beingEdited { false }
    user { nil }
    data { [build(:datum)] }
    user_holes { [build(:user_hole)] }
  end

  factory :hole_with_data_and_user_holes_and_user, class: Hole do 
    course_name { "MyString" }
    hole_number { 1 }
    is_beingEdited { false }
    user { build(:user) }
    data { [build(:datum)] }
    user_holes { [build(:user_hole)] }
  end

  factory :hole_with_data_and_user_holes_and_user_and_map_creator, class: Hole do
    course_name { "MyString" }
    hole_number { 1 }
    is_beingEdited { false }
    user { build(:map_creator) }
    data { [build(:datum)] }
    user_holes { [build(:user_hole)] }
  end

  factory :hole_with_data_and_user_holes_and_user_and_admin, class: Hole do
    course_name { "MyString" }
    hole_number { 1 }
    is_beingEdited { false }
    user { build(:admin) }
    data { [build(:datum)] }
    user_holes { [build(:user_hole)] }
  end

end
