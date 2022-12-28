# puts "🌱 Seeding spices..."

  # Seed your database here

  # # Make 2 mixologists
  # 2.times do
  #   Mixologist.create(name: Faker::Name.name)
  # end 

  # # Make 6 drinks
  # 6.times do
  #   drink = Drink.create(
  #     name
  #   )


# puts "✅ Done seeding!"

############
# require 'rest-client'

puts "🌱 Seeding drinks..."

URL = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="

# # drinks = ["martini", "Old Fashioned", "Mint Julep", "French 75", "White Russian"]
drinks = ["14167", "11001", "17206", "17197", "12528"]

# def get_response_body
  uri = URI.parse(URL)
puts uri
  drinks.each do |drink|
    # response = Net::HTTP.get_response("#{uri}#{drink}")
    response = Net::HTTP.get "#{uri}#{drink}"
    # response = RestClient.get "#{uri}#{drink}"


    # response = Net::HTTP.get_response("#{uri}/#{drink}")
    # https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=

    # RestClient.get "#{URL}#{drink}"
    # response = Net::HTTP.get_response(uri)

    drink_hash = JSON.parse(response)
  
    Drink.create(
      name: drink_hash["strDrink"],
      glass: drink_hash["strGlass"],
      instructions_en: drink_hash["strInstructions"],
      instructions_sp: drink_hash["strInstructions_sp"],
      ingredient1: drink_hash["strIngredient1"], 
      ingredient2: drink_hash["strIngredient2"],
      ingredient3: drink_hash["strIngredient3"], 
      # ingredient4: drink_hash["strIngredient4"], 
      # ingredient5: drink_hash["strIngredient5"], 
      measure1: drink_hash["strMeasure1"],
      measure2: drink_hash["strMeasure2"],
      measure3: drink_hash["strMeasure3"],
      # measure4: drink_hash["strMeasure4"],
      # measure5: drink_hash["strMeasure5"]
    )
  end

# response.body

# end


# def parse_json
#       data = JSON.parse(get_response_body) 
  
#       # ap data["drinks"].first
#   #     drinks = data["drinks"].collect do |obj|
  
#   #       obj # ["strDrink"]
#   #       # obj["strInstructions"]
#   #     end
#       # ap data # drinks
#       puts data
#     end

puts "✅ Done seeding!"

############


# # these are the spells we want to add to the database
# spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

# # iterate over each spell
# spells.each do |spell|
#   # make a request to the endpoint for the individual spell:
#   response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"

#   # the response will come back as a JSON-formatted string.
#   # use JSON.parse to convert this string to a Ruby hash:
#   spell_hash = JSON.parse(response)

#   # create a spell in the database using the data from this hash:
#   Spell.create(
#     name: spell_hash["name"],
#     level: spell_hash["level"],
#     description: spell_hash["desc"][0] # spell_hash["desc"] returns an array, so we need to access the first index to get just a string of the description
#   )
# end
