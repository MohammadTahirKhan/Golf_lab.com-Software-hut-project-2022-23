# == Schema Information
#
# Table name: data
#
#  id           :bigint           not null, primary key
#  terrain_type :integer
#  xCoordinates :string
#  yCoordinates :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  hole_id      :bigint
#  user_hole_id :bigint
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
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Factory' do
    it 'should have valid Factory' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      expect(data).to be_valid
    end
  end

  describe 'Associations' do
    it 'should belong to hole' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      expect(data.hole).to eq(hole)
    end

    it 'should belong to user_hole' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      expect(data.user_hole).to eq(user_hole)
    end
  end

  describe 'Validations' do
    it 'should ve valid with all attributes' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      expect(data).to be_valid
    end

    it 'should be valid without terrain_type' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: nil, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      expect(data).to be_valid
    end
    
    it 'should be valid without xcordinates' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: nil, yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      expect(data).to be_valid
    end

    it 'should be valid without ycordinates' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: nil, hole_id: 12123, user_hole_id: 12123)
      expect(data).to be_valid
    end
  end

  describe 'Associations' do
    it 'should belong to a hole' do
      t = Datum.reflect_on_association(:hole)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should belong to a user_hole' do
      t = Datum.reflect_on_association(:user_hole)
      expect(t.macro).to eq(:belongs_to)
    end
  end

  describe 'Methods' do
    it 'should return the correct xCoordinates' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      expect(data.xCoordinates).to eq("1,2,3")
    end

    it 'should return the correct yCoordinates' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      expect(data.yCoordinates).to eq("1,2,3")
    end

    it 'should return the correct terrain_type' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      expect(data.terrain_type).to eq("fairway")
    end
  end

  describe 'Scopes' do
    it 'should return the correct data for a hole' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      expect(Datum.find_by_hole_id(hole.id)).to eq(data)
    end

    it 'should return the correct data for a user_hole' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123) 
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      expect(Datum.find_by_user_hole_id(user_hole.id)).to eq(data)
    end
  end

  describe 'delete' do
    it 'should delete a datum' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      data.destroy
      expect(Datum.all).to eq([])
    end

    it 'should delete a datum when a hole is deleted' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      hole.destroy
      expect(Datum.all).to eq([])
    end

    it 'should delete a datum when a user_hole is deleted' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      user_hole.destroy
      expect(Datum.all).to eq([])
    end
  end

  describe 'update' do
    it 'should update a datum' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      data.update(terrain_type: 2)
      expect(Datum.find_by(id: 12123).terrain_type).to eq("rough")
    end

    it 'should update a datum when a hole is updated' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      hole.update(hole_number: 2)
      expect(Datum.find(12123).hole_id).to eq(12123)
    end

    it 'should update a datum when a user_hole is updated' do
      user = User.create(id: 12123, email: "a@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      user2 = User.create(id: 12124, email: "b@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12124, hole_id: 12123)  
      data = Datum.create(id: 12123, terrain_type: 1, xCoordinates: "1,2,3", yCoordinates: "1,2,3", hole_id: 12123, user_hole_id: 12123)
      user_hole.update(user_id: 12123)
      expect(Datum.find(12123).user_hole_id).to eq(12123)
    end
  end
    
  describe 'database' do
    it 'should have a terrain_type column' do
      expect(Datum.column_names).to include("terrain_type")
    end

    it 'should have a xCoordinates column' do
      expect(Datum.column_names).to include("xCoordinates")
    end

    it 'should have a yCoordinates column' do
      expect(Datum.column_names).to include("yCoordinates")
    end

    it 'should have a hole_id column' do
      expect(Datum.column_names).to include("hole_id")
    end

    it 'should have a user_hole_id column' do
      expect(Datum.column_names).to include("user_hole_id")
    end

    it 'should have a id column' do
      expect(Datum.column_names).to include("id")
    end
  end
    
end
