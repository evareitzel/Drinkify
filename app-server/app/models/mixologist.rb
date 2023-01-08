class Mixologist < ActiveRecord::Base
  has_many :drinks
  ####



  # drinks = Drink.all
  # drink_objs = Mixologist.drinks

  # has_many :drinks do
    # drink_objs = []

    # self.drinks.each do |drink|
    #   drink_objs << drink
    # end
  # end

  # //   current_user.favorites.each do |favourite|
  #   //   = favourite.colors
  #   // end

  # attr_accessor :drinks

  # Try editing out and see if app still works
  # def self.create_with_name(name)
  #   Mixologist.create(name: name)
  # end
end