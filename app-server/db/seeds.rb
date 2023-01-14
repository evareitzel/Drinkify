puts "🌱 Seeding mixologists..."

  Mixologist.create(name: "Brian Flanagan")
  Mixologist.create(name: "Liliana Lovell")

puts "🌱 Seeding drinks..."

Drink.create([
  {
    name: "Daiquiri",
    ingredients: "Light rum, Lime, Powdered sugar",
    instructions: "Pour all ingredients into shaker with ice cubes. Shake well. Strain in chilled cocktail glass.",
    mixologist_id: Mixologist.first.id,
  },
  {
    name: "Dry Martini",
    ingredients: "Gin, Dry Vermouth, Olive",
    instructions: "Straight: Pour all ingredients into mixing glass with ice cubes. Stir well. Strain in chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with olive.",
    mixologist_id: Mixologist.second.id,
  },
  {
    name: "Gimlet",
    ingredients: "Gin, Lime Juice, Sugar Syrup, Lime",
    instructions: "Add all the ingredients to a shaker and fill with ice.\r\n\r\nShake, and strain into a chilled cocktail glass or an Old Fashioned glass filled with fresh ice.\r\n\r\nGarnish with a lime wheel.",
    mixologist_id: Mixologist.first.id,
  },
  {
    name: "Gin Tonic",
    ingredients: "Gin, Tonic Water, Lemon Peel, Ice",
    instructions: "Fill a highball glass with ice, pour the gin, top with tonic water and squeeze a lemon wedge and garnish with a lemon wedge.",
    mixologist_id: Mixologist.first.id,
  },
  {
    name: "Manhattan",
    ingredients: "Sweet Vermouth, Bourbon, Angostura bitters, Ice, Maraschino cherry, Orange peel",
    instructions: "Stirred over ice, strained into a chilled glass, garnished, and served up.",
    mixologist_id: Mixologist.second.id,
  },
  {
    name: "Margarita",
    ingredients: "Tequila, Triple sec, Lime juice, Salt",
    instructions: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.",
    mixologist_id: Mixologist.second.id,
  },
  {
    name: "Mimosa",
    ingredients: "Champagne, Orange juice",
    instructions: "Ensure both ingredients are well chilled, then mix into the glass. Serve cold.",
    mixologist_id: Mixologist.first.id,
  },
  {
    name: "Mint Julep",
    ingredients: "Mint, Bourbon, Powdered sugar, Water",
    instructions: "In a highball glass gently muddle the mint, sugar and water. Fill the glass with cracked ice, add Bourbon and stir well until the glass is well frosted. Garnish with a mint sprig.",
    mixologist_id: Mixologist.second.id,
  },
  {
    name: "Mojito",
    ingredients: "Light rum, Lime, Sugar, Mint, Soda water",
    instructions: "Muddle mint leaves with sugar and lime juice. Add a splash of soda water and fill the glass with cracked ice. Pour the rum and top with soda water. Garnish and serve with straw.",
    mixologist_id: Mixologist.second.id,
  },
  {
    name: "Negroni",
    ingredients: "Gin, Campari, Sweet Vermouth",
    instructions: "Stir into glass over ice, garnish and serve.",
    mixologist_id: Mixologist.first.id,
  }, 
  {
    name: "Old Fashioned",
    ingredients: "Bitters, Water, Sugar, Bourbon, Orange, Maraschino cherry",
    instructions: "In an old-fashioned glass, muddle the bitters and water into the sugar cube, using the back of a teaspoon. Almost fill the glass with ice cubes and add the bourbon. Garnish with the orange slice and the cherry. Serve with a swizzle stick.",
    mixologist_id: Mixologist.first.id,
  },
  {
    name: "Pisco Sour",
    ingredients: "Pisco, Lemon juice, Sugar, Ice, Egg White",
    instructions: "Vigorously shake and strain contents in a cocktail shaker with ice cubes, then pour into glass and garnish with bitters.",
    mixologist_id: Mixologist.second.id,
  },
  {
    name: "Whiskey Sour",
    ingredients: "Blended whiskey, Lemon, Powdered sugar, Cherry, Lemon",
    instructions: "Shake with ice. Strain into chilled glass, garnish and serve. If served 'On the rocks', strain ingredients into old-fashioned glass filled with ice.",
    mixologist_id: Mixologist.first.id,
  },
])

puts "✅ Done seeding!"
