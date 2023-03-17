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
    hole_number { 1 }
    is_beingEdited { false }
    user_id { 1 }
    course_id { 1 }
  end
end
