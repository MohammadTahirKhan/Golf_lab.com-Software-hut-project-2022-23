# == Schema Information
#
# Table name: user_data
#
#  id           :bigint           not null, primary key
#  score        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_hole_id :bigint           not null
#
# Indexes
#
#  index_user_data_on_user_hole_id  (user_hole_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_hole_id => user_holes.id)
#
class UserDatum < ApplicationRecord
  belongs_to :user_hole
end