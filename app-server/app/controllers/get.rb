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
