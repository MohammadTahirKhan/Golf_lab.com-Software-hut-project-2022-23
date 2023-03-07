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
require 'rails_helper'

RSpec.describe UserHole, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
