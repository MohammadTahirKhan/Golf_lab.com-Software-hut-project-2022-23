# == Schema Information
#
# Table name: handicaps
#
#  id           :bigint           not null, primary key
#  value        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_hole_id :bigint           not null
#
# Indexes
#
#  index_handicaps_on_user_hole_id  (user_hole_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_hole_id => user_holes.id)
#
FactoryBot.define do
  factory :handicap do
    value { 1 }
    user_hole { nil }
  end
end
