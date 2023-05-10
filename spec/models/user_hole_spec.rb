# == Schema Information
#
# Table name: user_holes
#
#  id          :bigint           not null, primary key
#  hole_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hole_id     :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_user_holes_on_hole_id  (hole_id)
#  index_user_holes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (hole_id => holes.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe UserHole, type: :model do

  describe 'Factory' do
    it 'should have valid Factory' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12123, hole_id: 12123)
      expect(user_hole).to be_valid
    end

    it 'should have valid Factory with hole_number' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, hole_number: 1, user_id: 12123, hole_id: 12123)
      expect(user_hole).to be_valid
    end
    
    it 'should have valid Factory with hole_number and user_id' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, hole_number: 1, user_id: 12123, hole_id: 12123)
      expect(user_hole).to be_valid
    end
  end

  describe 'Associations' do
    it 'should belong to user' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, hole_number: 1, user_id: 12123, hole_id: 12123)
      expect(user_hole.user).to eq(User.find(user_hole.user_id))
    end
    
    it 'should belong to hole' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, hole_number: 1, user_id: 12123, hole_id: 12123)
      expect(user_hole.hole).to eq(Hole.find(user_hole.hole_id))
    end
  end

  describe 'Scopes' do
    it 'should return all user_holes' do
      expect(UserHole.all).to eq(UserHole.all)
    end
  end

  describe 'Methods' do
    it 'should return all user_holes with hole_number' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, hole_number: 1, user_id: 12123, hole_id: 12123)
      expect(UserHole.find_by_hole_number(1)).to eq(user_hole)
    end

    it 'should return all user_holes with hole_number and user_id' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, hole_number: 1, user_id: 12123, hole_id: 12123)
      expect(UserHole.find_by_hole_number_and_user_id(1, 12123)).to eq(user_hole)
    end
  end

  describe 'Validations' do
    it 'should validate presence of hole_number' do
      user_hole = UserHole.create(id: 12123, user_id: 12123, hole_id: 12123)
      expect(user_hole).to_not be_valid
    end

    it 'should validate presence of user_id' do
      user_hole = UserHole.create(id: 12123, hole_number: 1, hole_id: 12123)
      expect(user_hole).to_not be_valid
    end

    it 'should validate presence of hole_id' do
      user_hole = UserHole.create(id: 12123, hole_number: 1, user_id: 12123)
      expect(user_hole).to_not be_valid
    end
  end

  describe 'update' do
    it 'should update user_hole' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, hole_number: 1, user_id: 12123, hole_id: 12123)
      user_hole.update(hole_number: 12)
      expect(user_hole).to be_valid
    end
  end

  describe 'delete' do
    it 'should delete user_hole' do
      user = User.create(id: 12123, email: "1@gmail.com", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, hole_number: 1, user_id: 12123, hole_id: 12123)
      user_hole.destroy
      expect(UserHole.all).to_not include(user_hole)
    end
  end
end