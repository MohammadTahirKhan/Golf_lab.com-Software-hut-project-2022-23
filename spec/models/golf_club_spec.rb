# == Schema Information
#
# Table name: golf_clubs
#
#  id           :bigint           not null, primary key
#  club_type    :string
#  manufacturer :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_hole_id :bigint           not null
#
# Indexes
#
#  index_golf_clubs_on_user_hole_id  (user_hole_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_hole_id => user_holes.id)
#
require 'rails_helper'

RSpec.describe GolfClub, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
