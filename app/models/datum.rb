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
class Datum < ApplicationRecord
    belongs_to :hole
    belongs_to :user_hole
    
    enum :terrain_type, {rock:0, fairway:2, rough:3, green:4, bunker:5, tree:6, water:7}
end
