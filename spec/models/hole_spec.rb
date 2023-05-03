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

  describe 'Scopes' do
    it 'should return all holes' do
      expect(Hole.all).to eq(Hole.all)
    end
  end

  describe 'database' do
    user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "map_creator")
    it 'should have a hole_number' do
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole.hole_number).to eq(1)
    end

    it 'should have a course_name' do
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole.course_name).to eq("TestCourse")
    end

    it 'should have a is_beingEdited' do
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole.is_beingEdited).to eq(false)
    end

    it 'should have a user_id' do
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole.user_id).to eq(12123)
    end
  end

  describe 'validations' do
    user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "map_creator")
    it 'should not be valid without a hole_number' do
      hole = Hole.create(id: 12123, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole).to_not be_valid
    end

    it 'should not be valid without a is_beingEdited' do
      hole = Hole.create(id: 12123, hole_number: 1, user_id: 12123, course_name: "TestCourse")
      expect(hole).to_not be_valid
    end

    it 'should not be valid without a user_id' do
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, course_name: "TestCourse")
      expect(hole).to_not be_valid
    end

    it 'should not be valid without a course_name' do
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123)
      expect(hole).to_not be_valid
    end

    it 'should not be valid without a id' do
      hole = Hole.create(hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole).to_not be_valid
    end

    it 'should not be valid with a hole_number that is not an integer' do
      hole = Hole.create(id: 12123, hole_number: "abc", is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole).to_not be_valid
    end

    it 'should not be valid with a is_beingEdited that is not a boolean' do
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: "abc", user_id: 12123, course_name: "TestCourse")
      expect(hole).to_not be_valid
    end

    it 'should not be valid with a user_id that is not an integer' do
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: "abc", course_name: "TestCourse")
      expect(hole).to_not be_valid
    end

    it 'should not be valid with a course_name that is not a string' do
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: 123)
      expect(hole).to_not be_valid
    end

    it 'should not be valid with a id that is not an integer' do
      hole = Hole.create(id: "abc", hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole).to_not be_valid
    end

    it 'should not be valid with a hole_number that is not a positive integer' do
      hole = Hole.create(id: 12123, hole_number: -1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(hole).to_not be_valid
    end

    it 'should not be valid with a user_id that is not a positive integer' do
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: -1, course_name: "TestCourse")
      expect(hole).to_not be_valid
    end
  end

  describe 'update' do
    it 'should update the hole_number' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      hole.update(hole_number: 2)
      expect(hole.hole_number).to eq(2)
    end

    it 'should update the is_beingEdited' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      hole.update(is_beingEdited: true)
      expect(hole.is_beingEdited).to eq(true)
    end

    it 'should update the user_id' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      hole.update(user_id: 12345)
      expect(hole.user_id).to eq(12345)
    end

    it 'should update the course_name' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      hole.update(course_name: "TestCourse2")
      expect(hole.course_name).to eq("TestCourse2")
    end
  end

  describe 'delete' do
    it 'should delete the hole' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      hole.destroy
      expect(Hole.find_by(id: 12123)).to eq(nil)
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
