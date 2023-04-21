# == Schema Information
#
# Table name: holes
#
#  id             :bigint           not null, primary key
#  course_name    :string
#  hole_number    :integer
#  is_beingEdited :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint
#
# Indexes
#
#  index_holes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Hole, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Factory' do
    it 'should have valid Factory' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole).to be_valid
    end

    it 'should have valid Factory with hole_number' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole).to be_valid
    end

    it 'should have valid Factory with hole_number and user_id' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole).to be_valid
    end

    it 'should have valid Factory with hole_number and user_id and course_name' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole).to be_valid
    end
  end

  describe 'Associations' do
    it 'should belong to user' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole.user).to eq(user)
    end

    it 'should have user_holes' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, hole_id: 12123, user_id: 12123)
      expect(user_hole.hole).to eq(hole)
    end
  end
end
