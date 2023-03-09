# == Schema Information
#
# Table name: holes
#
#  id             :bigint           not null, primary key
#  hole_number    :integer
#  is_beingEdited :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  course_id      :bigint
#  user_id        :bigint
#
# Indexes
#
#  index_holes_on_course_id  (course_id)
#  index_holes_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (user_id => users.id)
#
class Hole < ApplicationRecord
    belongs_to :course
    belongs_to :user
    has_many :datum
end
