# == Schema Information
#
# Table name: data
#
#  id           :bigint           not null, primary key
#  terrain_type :integer
#  xCoordinates :string
#  yCoordinates :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  hole_id      :bigint
#  user_hole_id :bigint
#
# Indexes
#
#  index_data_on_hole_id       (hole_id)
#  index_data_on_user_hole_id  (user_hole_id)
#
# Foreign Keys
#
#  fk_rails_...  (hole_id => holes.id)
#  fk_rails_...  (user_hole_id => user_holes.id)
#
FactoryBot.define do
  factory :datum do
    xCoordinates { "MyString" }
    yCoordinates { "MyString" }
    hole_id { 1 }
    userhole_id { 1 }
  end
end
