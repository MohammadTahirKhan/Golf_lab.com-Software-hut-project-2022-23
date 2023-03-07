# == Schema Information
#
# Table name: user_holes
#
#  id          :bigint           not null, primary key
#  hole_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hole_id     :integer
#  user_id     :integer
#
FactoryBot.define do
  factory :user_hole do
    
  end
end
