class Category < Sinatra::Base
  has_many :tasks
end
