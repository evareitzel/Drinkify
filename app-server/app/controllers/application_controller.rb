class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Welcome to Drinkify!" }.to_json
  end

  get "/drinks" do
    { message: "Drinkify recipes from https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a" }.to_json
  end

end
