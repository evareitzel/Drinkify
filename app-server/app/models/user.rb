class Mixologist < ActiveRecord::Base
  has_many :drinks

  def self.create_with_name(name)
    Mixologist.create(name: name)
  end
end