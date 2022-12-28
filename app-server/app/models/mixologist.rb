# class Mixologist < Sinatra::Base
class Mixologist < ActiveRecord::Base
  has_many :drinks
end