class Drink < ActiveRecord::Base # Sinatra::Base
  belongs_to :user
end
