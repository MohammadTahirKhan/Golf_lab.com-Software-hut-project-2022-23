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
require 'rails_helper'

RSpec.describe Hole, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
