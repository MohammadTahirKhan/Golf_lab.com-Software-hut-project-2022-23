# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  role          :integer
#  user_name     :string
#  user_password :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :user do
    user_name { "MyString" }
    user_password { "MyString" }
  end
end
