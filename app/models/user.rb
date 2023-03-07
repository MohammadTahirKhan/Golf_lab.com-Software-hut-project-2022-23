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
class User < ApplicationRecord
    has_many :holes
    
    enum :role, {creator:1, user:2, administrator:3}
end
