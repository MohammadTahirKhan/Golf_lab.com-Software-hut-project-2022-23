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
#  hole_id       :bigint
#  user_hole_id  :bigint
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
require 'rails_helper'

RSpec.describe Datum, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
