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
#  hole_id       :integer
#  user_hole_id  :integer
#
class Datum < ApplicationRecord
    belongs_to :holes
    belongs_to :user_holes
    
    enum :terrain_type, {rock:0, fairway:2, rough:3, green:4, bunker:5, tree:6, water:7}
end
