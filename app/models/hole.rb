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
class Hole < ApplicationRecord
    belongs_to :courses
    belongs_to :users
    
    has_many :data
end
