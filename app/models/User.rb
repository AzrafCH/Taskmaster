class User < ActiveRecord::Base
  has_many :tasks, through: :catergories
  has_many :catergories
  has_secure_password
end
