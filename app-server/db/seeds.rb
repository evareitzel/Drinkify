puts "🌱 Seeding users..."

  # Seed your database here

  User.create(name: "Brian Flanagan")
  User.create(name: "Liliana Lovell")  

  # Make 2 mixologists
  # 2.times do
  #   User.create(name: Faker::Name.name)
  # end 

puts "🌱 Seeding drinks..."

  # # Make 6 drinks
  # 6.times do
  #   drink = Drink.create(
  #     name
  #   )

  Drink.create(
    name: "A1",
    glass: "Cocktail glass",
    instructions_en: "Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass.",
    instructions_sp: nil,
    ingredient1: "Gin",
    ingredient2: "Grand Marnier",
    ingredient3: "Lemon Juice",
    measure1: "1 3/4 shot"
  )
  Drink.create(
    name: "ABC",
    glass: "Shot glass",
    instructions_en: "Layered in a shot glass.",
    instructions_sp: nil,
    ingredient1: "Amaretto",
    ingredient2: "Baileys irish cream",
    ingredient3: "Cognac",
    measure1: "1/3"
  )
  Drink.create(
    name: "Ace",
    glass: "Martini Glass",
    instructions_en: "Shake all the ingredients in a cocktail shaker and ice then strain in a cold glass.",
    instructions_sp: nil,
    ingredient1: "Gin",
    ingredient2: "Grenadine",
    ingredient3: "Heavy cream",
    measure1: "2 shots"
  )
  Drink.create(
    name: "ACID",
    glass: "Shot glass",
    instructions_en: "Poor in the 151 first followed by the 101 served with a Coke or Dr Pepper chaser.",
    instructions_sp: nil,
    ingredient1: "151 proof rum",
    ingredient2: "Wild Turkey",
    ingredient3: nil,
    measure1: "1 oz Bacardi"
  )

puts "✅ Done seeding!"

  # [ 4] [
  #     [0] "Adam",
  #     [1] "Cocktail glass",
  #     [2] "Dark rum",
  #     [3] "Lemon juice",
  #     [4] "Grenadine",
  #     [5] nil,
  #     [6] "2 oz ",
  #     [7] "In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass."
  # ],
  # [ 5] [
  #     [0] "AT&T",
  #     [1] "Highball Glass",
  #     [2] "Absolut Vodka",
  #     [3] "Gin",
  #     [4] "Tonic water",
  #     [5] nil,
  #     [6] "1 oz ",
  #     [7] "Pour Vodka and Gin over ice, add Tonic and Stir"
  # ],
  # [ 6] [
  #     [0] "A. J.",
  #     [1] "Cocktail glass",
  #     [2] "Applejack",
  #     [3] "Grapefruit juice",
  #     [4] nil,
  #     [5] nil,
  #     [6] "1 1/2 oz ",
  #     [7] "Shake ingredients with ice, strain into a cocktail glass, and serve."
  # ],
  # [ 7] [
  #     [0] "Affair",
  #     [1] "Highball glass",
  #     [2] "Strawberry schnapps",
  #     [3] "Orange juice",
  #     [4] "Cranberry juice",
  #     [5] "Club soda",
  #     [6] "2 oz ",
  #     [7] "Pour schnapps, orange juice, and cranberry juice over ice in a highball glass. Top with club soda and serve."
  # ],
  # [ 8] [
  #     [0] "Apello",
  #     [1] "Collins Glass",
  #     [2] "Orange juice",
  #     [3] "Grapefruit juice",
  #     [4] "Apple juice",
  #     [5] "Maraschino cherry",
  #     [6] "4 cl ",
  #     [7] "Stirr. Grnish with maraschino cherry."
  # ],
  # [ 9] [
  #     [0] "Avalon",
  #     [1] "Highball glass",
  #     [2] "Vodka",
  #     [3] "Pisang Ambon",
  #     [4] "Apple juice",
  #     [5] "Lemon juice",
  #     [6] "3 parts",
  #     [7] "Fill a tall glass with ice. Layer the Finlandia Vodka, lemon and apple juices, Pisang Ambon, and top up with lemonade. Stir slightly and garnish with a spiralled cucumber skin and a red cherry. The cucumber provides zest and looks attractive. This drink, created by Timo Haimi, took first prize in the 1991 Finlandia Vodka Long Drink Competition."
  # ],

############
# require 'rest-client'

# puts "🌱 Seeding drinks..."

# URL = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="

# # # drinks = ["martini", "Old Fashioned", "Mint Julep", "French 75", "White Russian"]
# drinks = ["14167", "11001", "17206", "17197", "12528"]

# # def get_response_body
#   uri = URI.parse(URL)
# puts uri
#   drinks.each do |drink|
#     # response = Net::HTTP.get_response("#{uri}#{drink}")
#     response = Net::HTTP.get "#{uri}#{drink}"
#     # response = RestClient.get "#{uri}#{drink}"


#     # response = Net::HTTP.get_response("#{uri}/#{drink}")
#     # https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=

#     # RestClient.get "#{URL}#{drink}"
#     # response = Net::HTTP.get_response(uri)

#     drink_hash = JSON.parse(response)
  
#     Drink.create(
#       name: drink_hash["strDrink"],
#       glass: drink_hash["strGlass"],
#       instructions_en: drink_hash["strInstructions"],
#       instructions_sp: drink_hash["strInstructions_sp"],
#       ingredient1: drink_hash["strIngredient1"], 
#       ingredient2: drink_hash["strIngredient2"],
#       ingredient3: drink_hash["strIngredient3"], 
#       # ingredient4: drink_hash["strIngredient4"], 
#       # ingredient5: drink_hash["strIngredient5"], 
#       measure1: drink_hash["strMeasure1"],
#       measure2: drink_hash["strMeasure2"],
#       measure3: drink_hash["strMeasure3"],
#       # measure4: drink_hash["strMeasure4"],
#       # measure5: drink_hash["strMeasure5"]
#     )
#   end

# # response.body

# # end


# # def parse_json
# #       data = JSON.parse(get_response_body) 
  
# #       # ap data["drinks"].first
# #   #     drinks = data["drinks"].collect do |obj|
  
# #   #       obj # ["strDrink"]
# #   #       # obj["strInstructions"]
# #   #     end
# #       # ap data # drinks
# #       puts data
# #     end

# puts "✅ Done seeding!"

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
