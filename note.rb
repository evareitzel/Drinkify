require 'open-uri'
require 'net/http'
require 'json'
require 'awesome-print'

## phase-3-ruby-getting-remote-data-sending-get-requests/get.rb
url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'

uri = URI.parse(url)
response = Net::HTTP.get_response(uri)

p JSON.parse(response.body)

## phase-3-getting-remote-data-working-with-apis/lib/nyc_api.rb
class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  ## phase-3-ruby-getting-remote-data-lab/lib/get_requester.rb 
  class GetRequester
    def initialize(url)
      @url = url
    end
  
    def get_response_body
      uri = URI.parse(@url)
      response = Net::HTTP.get_response(uri)
      response.body
    end
  
    def parse_json
      JSON.parse(get_response_body)
    end
  end

end

programs = GetPrograms.new.get_programs
puts programs

#### From application_controller.rb


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


#### 
# FROM application_controller.rb 12/27/2022 11:50am

require 'net/http'
require 'open-uri'
require 'json'
# require 'awesome_print'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  URL = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'


  # get resp body
  # parse json
  
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


#### get.rb
# require 'net/http'
# require 'open-uri'
# require 'json'
# # require 'awesome_print'

# class GetRequester
#   URL = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'

#   def get_response_body
#     uri = URI.parse(URL)
#     response = Net::HTTP.get_response(uri)
#     response.body
#   end

#   def parse_json
#     data = JSON.parse(self.get_response_body)

#     drinks = data["drinks"].collect do |obj|

#       obj["strDrink"]
#     end
#   end

# end

# data = GetRequester.new
# p data.parse_json

# from setupTests.js:
# // jest-dom adds custom jest matchers for asserting on DOM nodes.
# // allows you to do things like:
# // expect(element).toHaveTextContent(/react/i)
# // learn more: https://github.com/testing-library/jest-dom
# import '@testing-library/jest-dom';

🥂🍻 🍸
