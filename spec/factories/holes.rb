# == Schema Information
#
# Table name: holes
#
#  id              :bigint           not null, primary key
#  hole_number     :integer
#  is_being_edited :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_id       :integer
#  user_id         :integer
#
FactoryBot.define do
  factory :hole do
    
  end
end
