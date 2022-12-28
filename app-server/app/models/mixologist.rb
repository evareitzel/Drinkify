class Mixologist < ActiveRecord::Base # Sinatra::Base
  has_many :drinks
end