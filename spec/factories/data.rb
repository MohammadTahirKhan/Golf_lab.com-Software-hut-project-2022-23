# == Schema Information
#
# Table name: data
#
#  id            :bigint           not null, primary key
#  terrain_type  :integer
#  x_coordinates :string
#  y_coordinates :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  hole_id       :integer
#  user_hole_id  :integer
#
FactoryBot.define do
  factory :datum do
    
  end
end
