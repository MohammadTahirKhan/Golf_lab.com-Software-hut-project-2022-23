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
class UserHole < ApplicationRecord
    belongs_to :users
    belongs_to :holes

    has_many :data

end
