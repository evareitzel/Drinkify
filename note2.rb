


##
##
##
## ARCHIVE ##

import React, { useEffect, useState } from "react"

import Header from "./Header"
// import Mixologist from "./Mixologist"
// import DrinkList from "./DrinkList"
// import NewDrink from "./NewDrink"
// import NewMixologist from "./NewMixologist"
import "./App.css"

export default function App() {
  const [mixologists, setMixologists] = useState([])
  const [drinks, setDrinks] = useState([])

  useEffect(() => {
    fetch("http://localhost:9292/mixologists")    
    .then(r => r.json())
    .then(mixologists => setMixologists(mixologists))
  }, [])

//   useEffect(() => {
//     fetch("http://localhost:9292/drinks")
//     .then(r => r.json())
//     .then(drinks => setDrinks(drinks))
//   }, [])

//   function handleAddMixologist(newMixologist){
//     setMixologists([...mixologists, newMixologist])
//   }

//   function handleAddDrink(newDrink) {
//     setDrinks([...drinks, newDrink])
//   }

  // function handleUpdateDrink(updatedDrink){
  //   console.log(updatedDrink)
//     const updatedDrinks = drinks.map(drink => {
//       if(drink.id === updatedDrink.id){
        // return updatedDrink
//       }else{
        // return drink
//       }
//     })
//     setDrinks(updatedDrinks)
  // }

  // function handleDeleteDrink(id){
  //   const updatedDrinks = drinks.filter(drink => drink.id !== id)
  //   setDrinks(updatedDrinks)
//   }  
  console.log(mixologists)
//   console.log(drinks)


//     onUpdateDrink={handleUpdateDrink}
//     onDeleteDrink={handleDeleteDrink} 
// />

  return (
    <div className="App">
      <div className="Wrapper">
        <Header />
        <h2>Mixologists</h2>
        {/* {renderMixologists} */}

        {/* // <NewDrink onAddDrink={handleAddDrink} mixologists={mixologists} />
//         <NewMixologist onAddMixologist={handleAddMixologist} />  */}

      </div>       
    </div>
  )
}}


#### ARCHIVE ####
import React, {useEffect, useState} from "react"
// import DrinkList from "./DrinkList"
import Drink from "./Drink"


export default function Mixologist({ mixologistId, onUpdateDrink, onDeleteDrink }){
  const [mixologist, setMixologist] = useState([])
  // const [drinks, setDrinks] = useState([])

  useEffect(() => {
    fetch(`http://localhost:9292/mixologists/${mixologistId}`)
    .then(r => r.json())
    .then(mixologist => setMixologist(mixologist))
    // .then(mixologist => setDrinks(mixologist.drinks))
  }, [mixologistId])

  function handleMixologistClick(e){
    console.log(`${mixologist.name} got clicked!`)

        // drinks.map(drink => (
        //   <Drink 
        //     key={drink.id} 
        //     drink={drink} 
        //     onUpdateDrink={onUpdateDrink}
        //     onDeleteDrink={onDeleteDrink}
        //     mixologist={mixologist}
        //   />
        // ))
  }

  console.log(mixologist.drinks)

  // const renderDrinks = 
  const drinks = mixologist.drinks
  console.log(drinks)
    // drinks.map(drink => (
    //       <Drink 
    //         key={drink.id} 
    //         drink={drink} 
    //         onUpdateDrink={onUpdateDrink}
    //         onDeleteDrink={onDeleteDrink}
    //         mixologist={mixologist}
    //       />
    //     ))

  return(
    <div>
      <a className="App-link" onClick={handleMixologistClick}>
        {mixologist.name}
      </a>
      {/* {renderDrinks} */}
      {/* <DrinkList drinks={mixologist.drinks} onUpdateDrink={onUpdateDrink} onDeleteDrink={onDeleteDrink}/>      */}
    </div>
  )
}

#
#
#
#
#
#
# ARCHIVED Drink.js

// import EditDrink from './EditDrink'

export default function Drink({drink, mixologist}){ 
// ({drink, onUpdateDrink, onDeleteDrink}){ 
  // mixologist, 

  // const {id, name, instructions, ingredients, image, mixologist_id} = drink

  // function handleDeleteClick(){
  //   fetch(`http://localhost:9292/drinks/${id}`, {
  //     method: "DELETE",
  //   });
  //   onDeleteDrink(id)
  // }

  // function show_author(user_id){
    // const found = users.find(user =>
    //   user.id === user_id)
  //   return found.name
  // }

  return(
    <div className="Card">
      {/* <img src={image} width="350" alt={name} className="Image" /> */}
      <h2>{drink.name}</h2>
      {/* <h2>{name}</h2> */}

      {/* <p>Recipe by {show_author(user_id)}</p> */}
      <p>Created by {mixologist.name}</p>

      {/* <form>
        <label>
          Author:
          <input type="select">{username}</input> 
        </label>
      </form> */}
      
      {/* <p>🍹 {ingredients}</p>
      <h3>Instructions</h3>
      <p>{instructions}</p> */}

      {/* <EditDrink drink={drink} onUpdateDrink={onUpdateDrink} /> */}
      {/* <form >
          <label className="label">Name 
          <input className="form-input"
            // onChange={e => setName(e.target.value)} 
            placeholder={name}
            type="text"
            value={name}
            // className="form-input"
          />
          </label>
          <label className="label">Instructions
          <input className="form-input"
            // onChange={e => setName(e.target.value)} 
            placeholder={instructions_en}
            type="text"
            value={instructions_en}
            // className="form-input"
          />
          </label>
    </form> */}
      {/* <a className="App-link" href="#" onClick={handleDeleteClick}>
        Delete drink
      </a> */}

      {/* <a className="App-link"  onClick={handleDeleteClick} >
        Delete
      </a> */}
      {/* add popup window confirming that drink was destroyed! */}
    </div>
  )
} 

#
#
#
#
#
# from NewDrink.js
from import React, { useState } from "react"

export default function NewDrink({ onAddDrink, mixologists }){
  const [name, setName] = useState("")
  // const [ingredients, setIngredients] = useState("")
  const [instructions, setInstructions] = useState("")
  const [mixologistId, setMixologistId] = useState("") // console-logs 'NULL' on submit
  const [mixologist, setMixologist] = useState("")

  function handleSubmit(e){
    e.preventDefault()
    window.alert(`${name} added!`)
    console.log(e.target.value)
    console.log(mixologistId)

    const drinkData = {
      name: name,
      instructions: instructions,
      mixologist_id: mixologistId // FIX
    }

    fetch("http://localhost:9292/drinks", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(drinkData),
    })
      .then(r => r.json())
      .then(newDrink => {
        onAddDrink(newDrink)
        setName("")
        setInstructions("")
      })
  }

  const options =  mixologists.map(mixologist => { 
    return  <option 
              key={mixologist.id} 
              value={mixologist.id}
            >
              {mixologist.name}
            </option>
  })
  
  const handleDropdownChange = e => {
    setMixologist(e.target.value)
  }
  console.log(mixologist)

  return(
    <div className="Form-wrapper">
      <a className="App-link" href="#" >
        Add new drink
      </a> {/* <h2>Add new drink</h2> */}
      <form className="Form" onSubmit={handleSubmit} >
        <label>Name
          <input
            onChange={e => setName(e.target.value)}
            placeholder="Drink name"
            type="text"
            value={name}
            className="Form-input"
        />
        </label>
        <label>Instructions
          <input
            onChange={e => setInstructions(e.target.value)}
            type="text"
            placeholder="Sugar, spice, everything nice..."
            value={instructions}
            className="Form-input"
          />
        </label>

        <label>
          Created by:
          <select value={mixologist} onChange={handleDropdownChange} className="Dropdown">
          
            {options}
          </select>
        </label>

        <div className="Button-wrapper">
          <button type="submit" className="Button">Add drink</button>
        </div>

        
      </form>

    </div>
  )
}

#
#
#
#
# From Mixologist.js
import React, {useEffect, useState} from "react"
import Drink from "./Drink"

export default function Mixologist({ mixologistId }){
    // remove state
  const [mixologist, setMixologist] = useState([])
  const [drinks, setDrinks] = useState([])
  const [cards, setCards] = useState(false)

  // no fetch, get data from mixol
  useEffect(() => {
    fetch(`http://localhost:9292/mixologists/${mixologistId}`)
    .then(r => r.json())
    .then(mixologist => {
      setMixologist(mixologist)
      setDrinks(mixologist.drinks)
    })
  }, [mixologistId])

  ////

  console.log(mixologist)
  console.log(mixologist.drinks)

const renderDrinks = drinks.map(drink => {
  return <Drink 
    key={drink.id} 
    drink={drink} 
    onUpdateDrink={handleUpdateDrink}
    onDeleteDrink={handleDeleteDrink}
    mixologist={mixologist}
  />
})
  
  const showCards = 
  cards 
  ? renderDrinks
  : null 
  // <p>{mixologist.name} has no drinks yet!</p> // add drink btn

  function handleUpdateDrink(updatedDrink){
    console.log(updatedDrink)
    const updatedDrinks = drinks.map(drink => {
    if(drink.id === updatedDrink.id){
      return updatedDrink
    }else{
      return drink
    }
  })
    setDrinks(updatedDrinks)
  }

  function handleDeleteDrink(id){
    const updatedDrinks = drinks.filter(drink => drink.id !== id)
    setDrinks(updatedDrinks)
  }  

  return(
    <div>
      <a className="App-link" onClick={() => setCards(!cards)}>
        {mixologist.name}
        {cards ? ' 🡨' : ' 🡪'}
      </a>
      {showCards}
    </div>
  )
}

#
#
#
# previous seeds.rb
puts "🌱 Seeding mixologists..."

  Mixologist.create(name: "Brian Flanagan") # , key: self.id)
  Mixologist.create(name: "Liliana Lovell") # , key: self.id)  

puts "🌱 Seeding drinks..."

Drink.create([
    {
  name: "Daiquiri",
  instructions: "Pour all ingredients into shaker with ice cubes. Shake well. Strain in chilled cocktail glass.", 
  ingredients: "Light rum, Lime, Powdered sugar", 
  image: "https://www.thecocktaildb.com/images/media/drink/mrz9091589574515.jpg",
  mixologist_id: Mixologist.first.id,
},
  {
    name: "Dry Martini",
    instructions: "Straight: Pour all ingredients into mixing glass with ice cubes. Stir well. Strain in chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with olive.", 
    ingredients: "Gin, Dry Vermouth, Olive", 
    image: "https://www.thecocktaildb.com/images/media/drink/6ck9yi1589574317.jpg",
    mixologist_id: Mixologist.second.id,
    # key: self.id,
  },
  {
    name: "Gimlet",
    instructions: "Add all the ingredients to a shaker and fill with ice.\r\n\r\nShake, and strain into a chilled cocktail glass or an Old Fashioned glass filled with fresh ice.\r\n\r\nGarnish with a lime wheel.", 
    ingredients: "Gin, Lime Juice, Sugar Syrup, Lime", 
    image: "https://www.thecocktaildb.com/images/media/drink/3xgldt1513707271.jpg",
    mixologist_id: Mixologist.first.id,
  },
  {
    name: "Gin Tonic",
    instructions: "Fill a highball glass with ice, pour the gin, top with tonic water and squeeze a lemon wedge and garnish with a lemon wedge.", 
    ingredients: "Gin, Tonic Water, Lemon Peel, Ice", 
    image: "https://www.thecocktaildb.com/images/media/drink/qcgz0t1643821443.jpg",
    mixologist_id: Mixologist.first.id,
    # key: self.id,
  },
  {
    name: "Manhattan",
    instructions: "Stirred over ice, strained into a chilled glass, garnished, and served up.", 
    ingredients: "Sweet Vermouth, Bourbon, Angostura bitters, Ice, Maraschino cherry, Orange peel", 
    image: "https://www.thecocktaildb.com/images/media/drink/yk70e31606771240.jpg",
    mixologist_id: Mixologist.second.id,
  },
  {
    name: "Margarita",
    instructions: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.", 
    ingredients: "Tequila, Triple sec, Lime juice, Salt", 
    image: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg",
    mixologist_id: Mixologist.second.id,
    # key: self.id,
  },
  # {
  #   name: "Mimosa",
  #   instructions: "Ensure both ingredients are well chilled, then mix into the glass. Serve cold.", 
  #   ingredients: "Champagne, Orange juice", 
  #   image: "https://www.thecocktaildb.com/images/media/drink/juhcuu1504370685.jpg",
  #   mixologist_id: Mixologist.first.id,
  # },
#   {
#   name: "Mint Julep",
#   instructions: "In a highball glass gently muddle the mint, sugar and water. Fill the glass with cracked ice, add Bourbon and stir well until the glass is well frosted. Garnish with a mint sprig.", 
#   ingredients: "Mint, Bourbon, Powdered sugar, Water", 
#   image: "https://www.thecocktaildb.com/images/media/drink/squyyq1439907312.jpg",
#   mixologist_id: Mixologist.second.id,
# },
#   {
#     name: "Mojito",
#     instructions: "Muddle mint leaves with sugar and lime juice. Add a splash of soda water and fill the glass with cracked ice. Pour the rum and top with soda water. Garnish and serve with straw.", 
#     ingredients: "Light rum, Lime, Sugar, Mint, Soda water",
#     image: "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
#     mixologist_id: Mixologist.second.id,
#     # key: self.id,
#   },
#   {
#     name: "Negroni",
#     instructions: "Stir into glass over ice, garnish and serve.", 
#     ingredients: "Gin, Campari, Sweet Vermouth", 
#     image: "https://www.thecocktaildb.com/images/media/drink/qgdu971561574065.jpg",
#     mixologist_id: Mixologist.first.id,
#     # key: self.id,
#   }, 
#   {
#     name: "Old Fashioned", 
#     instructions: "In an old-fashioned glass, muddle the bitters and water into the sugar cube, using the back of a teaspoon. Almost fill the glass with ice cubes and add the bourbon. Garnish with the orange slice and the cherry. Serve with a swizzle stick.", 
#     ingredients: "Bitters, Water, Sugar, Bourbon, Orange, Maraschino cherry", 
#     image: "https://www.thecocktaildb.com/images/media/drink/w8cxqv1582485254.jpg", 
#     mixologist_id: Mixologist.first.id,
#     # key: self.id,
#   },
#   {
#     name: "Pisco Sour",
#     instructions: "Vigorously shake and strain contents in a cocktail shaker with ice cubes, then pour into glass and garnish with bitters.", 
#     ingredients: "Pisco, Lemon juice, Sugar, Ice, Egg White", 
#     image: "https://www.thecocktaildb.com/images/media/drink/tsssur1439907622.jpg",
#     mixologist_id: Mixologist.second.id,
#     # key: self.id,
#   },
#   {
#     name: "Whiskey Sour",
#     instructions: "Shake with ice. Strain into chilled glass, garnish and serve. If served 'On the rocks', strain ingredients into old-fashioned glass filled with ice.", 
#     ingredients: "Blended whiskey, Lemon, Powdered sugar, Cherry, Lemon", 
#     image: "https://www.thecocktaildb.com/images/media/drink/hbkfsh1589574990.jpg",
#     mixologist_id: Mixologist.first.id,
#   },
])

puts "✅ Done seeding!"


# {
#   name: "",
#   instructions: "", 
#   ingredients: "", 
#   image: "",
#   mixologist_id: Mixologist.first.id,
# },


##########################################################################
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


#########################################################

  # # Seed your database here

    # Make 2 mixologists
  # 2.times do
  #   User.create(name: Faker::Name.name)
  # end 

    # # Make 6 drinks
  # 6.times do
  #   drink = Drink.create(
  #     name
  #   )

  # Drink.create([
  #   {
  #     name: "A1",
  #     glass: "Cocktail glass",
  #     instructions_en: "Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass.",
  #     instructions_sp: nil,
  #     ingredient1: "Gin",
  #     ingredient2: "Grand Marnier",
  #     ingredient3: "Lemon Juice",
  #     ingredient4: "Grenadine",
  #     ingredient5: nil, 
  #     measure1: "1 3/4 shot",
  #     measure2: "1 Shot",
  #     measure3: "1/4 Shot",
  #     measure4: "1/8 Shot",
  #     measure5: nil,
  #     mixologist_id: Mixologist.first.id
  #   },
  #   {
  #     name: "ABC",
  #     glass: "Shot glass",
  #     instructions_en: "Layered in a shot glass.",
  #     instructions_sp: nil,
  #     ingredients: {
  #       ingredient1: "Amaretto",
  #       ingredient2: "Baileys irish cream",
  #       ingredient3: "Cognac",
  #     },

  #     # ingredient4: nil,
  #     # ingredient5: nil, 
  #     measure1: "1/3",
  #     measure2: "1/3",
  #     measure3: "1/3",
  #     # measure4: nil,
  #     # measure5: nil,
  #     mixologist_id: Mixologist.first.id
  #   },
  #   {
  #     name: "Ace",
  #     glass: "Martini Glass",
  #     instructions_en: "Shake all the ingredients in a cocktail shaker and ice then strain in a cold glass.",
  #     instructions_sp: nil,
  #     ingredient1: "Gin",
  #     ingredient2: "Grenadine",
  #     ingredient3: "Heavy cream",
  #     ingredient4: "Milk",
  #     ingredient5: "Egg White",
  #     measure1: "2 shots",
  #     measure2: "1/2 shot",
  #     measure3: "1/2 shot",
  #     measure4: "1/2 shot",
  #     measure5: "1/2 Fresh",
  #     mixologist_id: Mixologist.second.id
  #   },
  #   {    
  #     name: "ACID",
  #     glass: "Shot glass",
  #     instructions_en: "Poor in the 151 first followed by the 101 served with a Coke or Dr Pepper chaser.",
  #     instructions_sp: nil,
  #     ingredient1: "151 proof rum",
  #     ingredient2: "Wild Turkey",
  #     ingredient3: nil,
  #     ingredient4: nil,
  #     ingredient5: nil,
  #     measure1: "1 oz Bacardi",
  #     measure2: "1 oz",
  #     measure3: nil,
  #     measure4: nil,
  #     measure5: nil,
  #     mixologist_id: Mixologist.second.id
  #   }  
  # ])

  # Drink.create(
  #   name: "A1",
  #   glass: "Cocktail glass",
  #   instructions_en: "Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass.",
  #   instructions_sp: nil,
  #   ingredient1: "Gin",
  #   ingredient2: "Grand Marnier",
  #   ingredient3: "Lemon Juice",
  #   measure1: "1 3/4 shot"
  # )
  # Drink.create(
  #   name: "ABC",
  #   glass: "Shot glass",
  #   instructions_en: "Layered in a shot glass.",
  #   instructions_sp: nil,
  #   ingredient1: "Amaretto",
  #   ingredient2: "Baileys irish cream",
  #   ingredient3: "Cognac",
  #   measure1: "1/3"
  # )
  # Drink.create(
  #   name: "Ace",
  #   glass: "Martini Glass",
  #   instructions_en: "Shake all the ingredients in a cocktail shaker and ice then strain in a cold glass.",
  #   instructions_sp: nil,
  #   ingredient1: "Gin",
  #   ingredient2: "Grenadine",
  #   ingredient3: "Heavy cream",
  #   measure1: "2 shots"
  # )
  # Drink.create(
  #   name: "ACID",
  #   glass: "Shot glass",
  #   instructions_en: "Poor in the 151 first followed by the 101 served with a Coke or Dr Pepper chaser.",
  #   instructions_sp: nil,
  #   ingredient1: "151 proof rum",
  #   ingredient2: "Wild Turkey",
  #   ingredient3: nil,
  #   measure1: "1 oz Bacardi"
  # )


##################################################
    # {
  #   name: "A1",
  #   instructions: "Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass.", 
  #   ingredients: "Gin, Grand Marnier, Lemon Juice", 
  #   image: "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg",
  #   mixologist_id: Mixologist.first.id,
  #   # key: self.id,
  # },
  # {
  #   name: "ABC",
  #   instructions: "Layered in a shot glass.", 
  #   ingredients: "Amaretto, Baileys irish cream, Cognac", 
  #   image: "https://www.thecocktaildb.com/images/media/drink/tqpvqp1472668328.jpg", 
  #   mixologist_id: Mixologist.second.id,   
  #   # key: self.id,
  # },
  # {
  #   name: "Ace",
  #   instructions: "Shake all the ingredients in a cocktail shaker and ice then strain in a cold glass.", 
  #   ingredients: "Gin, Grenadine, Heavy cream, Milk, Egg White", 
  #   image: "https://www.thecocktaildb.com/images/media/drink/l3cd7f1504818306.jpg",
  #   mixologist_id: Mixologist.first.id,
  #   # key: self.id,
  # },
  # {
  #   name: "ACID",
  #   instructions: "Pour in the 151 first followed by the 101 served with a Coke or Dr Pepper chaser.", 
  #   ingredients: "151 proof rum, Wild Turkey", 
  #   image: "https://www.thecocktaildb.com/images/media/drink/xuxpxt1479209317.jpg",
  #   mixologist_id: Mixologist.second.id,
  #   # key: self.id,
  # },
  # {
  #   name: "Adam",
  #   instructions: "In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.", 
  #   ingredients: "Dark rum, Lemon juice, Grenadine", 
  #   image: "https://www.thecocktaildb.com/images/media/drink/v0at4i1582478473.jpg",
  #   mixologist_id: Mixologist.first.id,
  #   # key: self.id,
  # },

