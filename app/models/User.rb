class User < ActiveRecord::Base
  has_many :tasks, through: :categories
  has_many :categories
  has_secure_password
end
