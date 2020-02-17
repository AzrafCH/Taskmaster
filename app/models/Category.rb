class Category < Sinatra::Base
  has_many :tasks
  belongs_to :users
end
