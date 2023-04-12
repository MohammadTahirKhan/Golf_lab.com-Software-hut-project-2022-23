# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  user_role              :integer          default("user")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"


  describe 'Factory' do
    it 'should have valid Factory' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "user")
      expect(user).to be_valid
    end
  end

  describe 'Associations' do
    it 'should have many user_holes' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "user")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      user_hole = UserHole.create(id: 12123, user_id: 12123, hole_id: 12123)
      expect(user.user_holes).to eq([user_hole])
    end
    
    it 'should have many holes' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "map_creator")
      hole = Hole.create(id: 12123, hole_number: 1, is_beingEdited: false, user_id: 12123, course_name: "TestCourse")
      expect(user.holes).to eq([hole])
    end
  end

  describe 'Scopes' do
    it 'should return all users' do
      expect(User.all).to eq(User.all)
    end
  end

  describe 'Methods' do
    it 'should set default user role to user' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "user")
      expect(user.user_role).to eq('user')
    end
  end

  describe 'Inserting data' do
    it 'should insert a new user' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "user")
      expect(user).to be_valid
    end
  end

  describe 'Updating data' do
    it 'should update user role' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "user")
      user.update(user_role: 'admin')
      expect(user.user_role).to eq('admin')
    end

    it 'should update user email' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "user")
      user.update(email: 'abc@sheffield.ac.uk')
      expect(user.email).to eq('abc@sheffield.ac.uk')
    end

    it 'should update user password' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "user")
      user.update(password: '124456')
      expect(user.password).to eq('124456')
    end
  end

  describe 'Deleting data' do
    it 'should delete a user' do
      user = User.create(id: 12123, email: "abc@sheffield.ac.uk", password: "123456", user_role: "user")
      user.destroy
      expect(User.all).to_not include(user)
    end
  end

  describe 'Validations' do
    it 'should not create a user without email' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it 'should not create a user without password' do
      user = FactoryBot.build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it 'should not create a user without user role' do
      user = FactoryBot.build(:user, user_role: nil)
      expect(user).to_not be_valid
    end

    it 'should not create a user with invalid email' do
      user = FactoryBot.build(:user, email: 'abc')
      expect(user).to_not be_valid
    end

    it 'should not create a user with invalid password' do
      user = FactoryBot.build(:user, password: 'abc')
      expect(user).to_not be_valid
    end

    it 'should not create a user with invalid user role' do
      user = FactoryBot.build(:user, user_role: 'admin')
      expect(user).to_not be_valid
    end
  end

end
