class Mixologist < ActiveRecord::Base
  has_many :drinks

  # Try editing out and see if app still works
  def self.create_with_name(name)
    Mixologist.create(name: name)
  end
end