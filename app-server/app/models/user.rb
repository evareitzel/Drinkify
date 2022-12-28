class User < ActiveRecord::Base # Sinatra::Base
  has_many :drinks

  def self.create_with_name(name)
    User.create(name: name)
  end
end