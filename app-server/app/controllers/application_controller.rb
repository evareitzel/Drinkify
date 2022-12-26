class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Welcome to Drinkify!" }.to_json
  end

  get "/drinks" do
     # get all the drinks from the database
     drinks = Drink.all.order(:name).limit(6)
    # return a JSON response with an array of all the drink data
    drinks.to_json

    { message: "Drinkify recipes from https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a" }.to_json
  end
    # look up the game in the database using its ID
    # send a JSON-formatted response of the game data
  get '/drinks/:name' do
    drink = Drink.find_by(params[:name]) # check
    drink.to_json
  end

end
