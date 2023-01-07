require 'net/http'
require 'open-uri'
require 'json'
require 'awesome_print'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
    
  # Add your routes here
  post '/drinks' do
    drink = Drink.create(name: params[:name], instructions_en: params[:instructions_en])
    drink.to_json
  end

  get '/drinks' do
    drinks = Drink.all
    drinks.to_json
  end

  patch '/drinks/:id' do
    drink = Drink.find(params[:id])
    drink.update(
      name: params[:name],
      instructions_en: params[:instructions_en]
    )
    drink.to_json
  end

  delete "/drinks/:id" do
    drink = Drink.find(params[:id])
    drink.destroy
    drink.to_json
  end

  get '/users' do # mixologists
    users = User.all
    users.to_json
  end

  post '/users' do
    user = User.create(name: params[:name])
    user.to_json
  end

  class GetRequester
    URL = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'
  
    def get_response_body
      uri = URI.parse(URL)
      response = Net::HTTP.get_response(uri)
      response.body
    end
  
    def parse_json
      data = JSON.parse(self.get_response_body)
  
      drinks = data["drinks"].collect do |obj|
  
        [
          obj["strDrink"], 
          obj["strGlass"], 
          obj["strIngredient1"], 
          obj["strIngredient2"], 
          obj["strIngredient3"], 
          obj["strIngredient4"], 
          obj["strIngredient5"], 
          obj["strMeasure1"], 
          obj["strMeasure2"], 
          obj["strMeasure3"], 
          obj["strMeasure4"], 
          obj["strMeasure5"], 
          obj["strInstructions"]
        ]
      
        end

    end
  
  end
  
  data = GetRequester.new
  ap data.parse_json

end

# drinks.each do |drink|
#   # here you would save each data object/each drink to the database as a new drink directly
#   Drink.create! 
# end
