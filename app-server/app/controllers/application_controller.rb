require 'net/http'
require 'open-uri'
require 'json'
require 'awesome_print'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
    
  #   # Add your routes here
  #   get "/" do
  #     { message: "Good luck with your project!" }.to_json
  #   end

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
          obj["strMeasure1"], 
          obj["strInstructions"]
        ]

        # "name" => 
      
      end
    end
  
  end
  
  data = GetRequester.new
  ap data.parse_json

end


  # "message": "Welcome to Drinkify!"

  # get '/drinks' do
  #   data = GetRequester.new
  #   ap data.parse_json
  # end

  # get resp body
  # parse json
  
  # get '/drinks/:name' do
  #   drink = Drink.find_by(params[:name]) # check
  #   drink.to_json
  # end

  # get "/" do
  #   { message: "<h1>Welcome to our Drinks Recipe app!</h1>"}.to_json
  #   # { drinks: "https://www.thecocktaildb.com/api/jso;n/v1/1/search.php?f=a"  }.to_json
  # end