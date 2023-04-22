# == Schema Information
#
# Table name: user_holes
#
#  id          :bigint           not null, primary key
#  hole_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hole_id     :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_user_holes_on_hole_id  (hole_id)
#  index_user_holes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (hole_id => holes.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :user_hole do
    hole_number { 1 }
    hole { nil }
    user { nil }
  end

  factory :user_hole_with_data, class: UserHole do
    hole_number { 1 }
    hole { nil }
    user { nil }
    data { [build(:datum)] }
  end

  factory :user_hole_with_hole, class: UserHole do
    hole_number { 1 }
    hole { build(:hole) }
    user { nil }
  end

  factory :user_hole_with_data_and_hole, class: UserHole do
    hole_number { 1 }
    hole { build(:hole) }
    user { nil }
    data { [build(:datum)] }
  end

  factory :user_hole_with_hole_and_user, class: UserHole do
    hole_number { 1 }
    hole { build(:hole) }
    user { build(:user) }
  end

  factory :user_hole_with_data_and_hole_and_user, class: UserHole do
    hole_number { 1 }
    hole { build(:hole) }
    user { build(:user) }
    data { [build(:datum)] }
  end

end
