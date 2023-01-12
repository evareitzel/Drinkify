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

🥂🍻 🍸 🥃 🍹

################################################
# from application_controller: # before refactor 1/4/23

require 'net/http'
require 'open-uri'
require 'json'
require 'awesome_print'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
    
  # Add your routes here
  # get "/" do
  #   { message: "Welcome to Drinkify! The sharing space for mixologists 🍹" }.to_json
  # end

  post '/drinks' do
    drink = Drink.create(name: params[:name], instructions_en: params[:instructions_en])
    drink.to_json # (include: { user: {only: [:user]} })
  end

  get '/drinks' do
    drinks = Drink.all # .order
    drinks.to_json # (include: { user: ... })
  end
  # data = GetRequester.new
  # ap data.parse_json

  patch '/drinks/:id' do # are double quotes needed?
    drink = Drink.find(params[:id])
    drink.update(
      name: params[:name],
      instructions_en: params[:instructions_en]
    )
    drink.to_json # (include: { user: ... })
  end

  delete "/drinks/:id" do # ""
    drink = Drink.find(params[:id])
    drink.destroy
    drink.to_json
  end

  get '/users' do
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
        # "name" => 
      
      end
    end
  
  end
  
  data = GetRequester.new
  ap data.parse_json

end

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


  ###########################
  # unused DrinkForm

  import React, { useEffect, useState } from "react";

  export default function DrinkForm({drink}){
    // onSubmit={handleSubmit}
    return(
      <form >
        <label>
          <input></input>
        </label>
            <label className="label">Name 
            <input 
              onChange={e => setName(e.target.value)} 
              placeholder={drink.name}
              type="text"
              value={name}
              // className="form-input"
            />
            </label>
      </form>
    )
  }

#### Edit Drink link
<a className="App-link" href="#" >
Edit drink
</a>

#### Delete Drink button (pre link)
<button onClick={handleDeleteClick}>
  Delete drink
</button>

#### from NewDrink.js
const options =  mixologists.map(mixologist => { 
  return <option key={mixologist.id}>{mixologist.name}</option>
})

<label>Created by
<select>
  {options}
</select>
</label>



#### from App.js
// import Search from "./Search"

// const [search, setSearch] = useState("")

#### From seeds.rb
User.create(name: "Brian Flanagan")
User.create(name: "Liliana Lovell")  

#### User.rb
// Nest under App component, over Drink.js
import DrinkList from "./DrinkList";
import NewDrink from "./NewDrink";


export default function User({user, drinks, onAddDrink, onUpdateDrink, onDeleteDrink}){
  const {name} = user
  return(
    <div>
      {/* <h3>{name}</h3> */}
      <DrinkList 
        drinks={drinks}
        username={name}
        // currentUser={testUser}
        onAddDrink={onAddDrink}
        onUpdateDrink={onUpdateDrink} 
        onDeleteDrink={onDeleteDrink} 
      />
      <NewDrink onAddDrink={onAddDrink} />
    </div>
  )
}

## from App.js
// import User from "./User"

{users.map(user => (
  <User
    user={user}
    drinks={drinks} // displayedDrinks
    onAddDrink={handleAddDrink}        
    onUpdateDrink={handleUpdateDrink} 
    onDeleteDrink={handleDeleteDrink} 
  />
))}

# From NewDrink.js
// username: currentUser.username,

// function options(users){
  //   users.map(user => user.name)
  // }

  // const options1 = [
  //   { 
  //     value: 1,
  //     label: "Leanne Graham"
  //   },
  //   {
  //     value:  2,
  //     label: "Ervin Howell"
  //   }
  // ]

  <label>Created by
  {/* dropdown */}
  {/* user.all - search React*/}
    <select>
      {options}
    </select>
  </label>

  ## User.js (edited down, then deleted)
  // Nest under App component, over Drink.js


export default function User({user, drinks, onAddDrink, onUpdateDrink, onDeleteDrink}){
  return(
    <div>
      {/* <h3>{name}</h3> */}
    </div>
  )
}

## From App.js
// <Filter.js> filter - show user's drinkList. (or similar)

// const displayedDrinks = drinks.filter(drink => 
  //   // message.body.toLowerCase().includes(search.toLowerCase())
  //   drink.owner.toLowerCase().includes(currentUser.tolowercase())  
  // )

  // authors?

  // const displayedDrinks = drinks.filter(drink => ( 
  // drink.user_id === search
  // ))  

  {/* <Search /> */}
  // username={name}  // const {name} = user
  // currentUser={testUser}


########################################################
# FROM application_controller.rb


# drinks.each do |drink|
#   # here you would save each data object/each drink to the database as a new drink directly
#   Drink.create! 
# end

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
        obj["strInstructions"],
        obj["strDrinkThumb"],
        # {
        #   i1: obj["strIngredient1"],
        #   # i2: obj["strIngredient2"],
        #   # i3: obj["strIngredient3"],
        # }
      ]
    
      end

  end

end

data = GetRequester.new
# ap data.parse_json
parsed = data.parse_json
# ap parsed
# seed = []
# parsed.map(drink => 
#   seed << drink
# )
# ap seed
seed2 = parsed.each do |drink|
  drink
  # add "belongs_to(0..num_mixologists.to_i.random"
end

ap seed2
# how to run the seed?


## From .canvas
---
:lessons:
- :id: 121173
  :course_id: 3299
  :canvas_url: https://learning.flatironschool.com/courses/3299/pages/121173
  :type: page


####################### from application_controller.rb

# get '/mixologists' do
#   mixologists = Mixologist.all.includes(:drinks)
#   mixologists.to_json
# end


## Notes from App.js (attempts to get nested data)
//// START Mixologists w Drinks data
// const [mixologistsWithDrinks, setMixologistsWithDrinks] = useState([])


// useEffect(() => {
//   fetch("http://localhost:9292/mixologists")    
//   .then(r => r.json())
//   .then(mixologistsWithDrinks => setMixologistsWithDrinks(mixologistsWithDrinks))
// }, [])
// console.log(`mixologistsWithDrinks: ${mixologistsWithDrinks}`)
// debugger
// console.log(mixologistsWithDrinks)
// const m1 = mixologistsWithDrinks[0]
// console.log(m1)
// console.log(m1.drink_objs)

// const m1Drinks = m1[drinks] // .map(drink => drink.name)
// console.log(m1Drinks)
//   current_user.favorites.each do |favourite|
//   = favourite.colors
// end

// const url = 'http://localhost:9292/mixologists'

//   const getMixologistsIndex = (url) =>{
//     fetch(url)
//     .then(response => response.json())
//     .then(mixologists => mixologists.data.forEach(mixologist => new Mixologist(mixologist).renderMixologist()));
// }

// console.log(getMixologistsIndex(url))
//// END Mixologists w Drinks data

#### from App.js

// useEffect(() => {
  //   fetch("http://localhost:9292/drinks")
  //   .then(r => r.json())
  //   .then(latestDrinks => setLatestDrinks(latestDrinks))
  // }, [])

  ////////
  // function renderMixologists(mixologists){ // (){
  // // const mixologistIds = 
  //   mixologists.map(mixologist => {
  //     mixologist.id
  //   })
  //   console.log(mixologistIds)
  //   mixologistIds.each(mixologistId => <Mixologist mixologistId={mixologistId} />)  
  // }
    // console.log('hi!')

    // renderMixologists(mixologists)
    // console.log(mixologists)

####################
####################
#################### NewDrink.js code -->

    import React, { useState } from "react"

export default function NewDrink({ onAddDrink, mixologists }){ // , mixologist
  const [name, setName] = useState("");
  const [instructions, setInstructions] = useState("");

  // const mixologistId = mixologist.id
  // console.log(mixologistId)

  function handleSubmit(e){
    e.preventDefault()
    window.alert(`${name} added to drinks!`)

console.log(e.target.value)    
    // {
    //   name: name,
    //   instructions: instructions,
    //   mixologist_id: mixologistId
    // }

    const drinkData = {
      name: name,
      instructions: instructions,
      mixologist_id: mixologist_id// mixologist.id
    }
    console.log(`New drink obj for fetch: ${drinkData}`)
    console.log(JSON.stringify(drinkData))

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
    return <option key={mixologist.id} value={mixologist.id}
    >{mixologist.name}</option>
  })
  

  return(
    <div className="Form-wrapper">
      {/* <a className="App-link" href="#" >
        Add new drink
      </a> */}
      <h2>Add new drink</h2>
      <form className="Form" onSubmit={handleSubmit} >
        <label>Name
          <input
            className="Form-input"
            type="text"
            name="name"
            // autoComplete="off"
            value={name}
            onChange={e => setName(e.target.value)}
          />
        </label>
        <label>Instructions
          <input
            className="Form-input"
            type="text"
            name="instructions"
            // autoComplete="off"
            value={instructions}
            onChange={e => setInstructions(e.target.value)}
          />
        </label>

        <label>Created by
  <select>
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
    


// autoComplete="off"



####
####
####
####
#### from Mixologist.js
import React, {useEffect, useState} from "react"

export default function Mixologist({ mixologistId }){
  const [mixologist, setMixologist] = useState([])

  useEffect(() => {
    fetch(`http://localhost:9292/mixologists/${mixologistId}`)
    .then(r => r.json())
    .then(mixologist => setMixologist(mixologist))
  }, [mixologistId])

  function handleMixologistClick(e){
    console.log(`${mixologist.name} got clicked!`)
  }

  console.log(mixologist.drinks)
  
  const renderDrinks = mixologist.drinks.map(drink => {
    console.log(drink)
  })

  // const options =  mixologists.map(mixologist => { 
  //   return  <option 
  //             key={mixologist.id} 
  //             value={mixologist.id}
  //           >
  //             {mixologist.name}
  //           </option>
  // })

  return(
    <div>
      <a className="App-link" onClick={handleMixologistClick}>
        {mixologist.name}
      </a>
      <>{renderDrinks}</>
               
    </div>
  )
}

#
#
#
#
#
#
#
#
#
#
import React, { useEffect, useState } from "react"

import Header from "./Header"
import Mixologist from "./Mixologist"
// import DrinkList from "./DrinkList"
// import NewDrink from "./NewDrink"
// import NewMixologist from "./NewMixologist"
import "./App.css"

function App() {
  const [mixologists, setMixologists] = useState([])
//   const [drinks, setDrinks] = useState([])

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

//   function handleUpdateDrink(updatedDrink){
//     const updatedDrinks = drinks.map(drink => {
//       if(drink.id === updatedDrink.id){
//         return updatedDrink
//       }else{
//         return drink
//       }
//     })
//     setDrinks(updatedDrinks)
//   }

//   function handleDeleteDrink(id){
//     const updatedDrinks = drinks.filter(drink => drink.id !== id)
//     setDrinks(updatedDrinks)
//   }  
//   console.log(mixologists)
//   console.log(drinks)

  return (
    <div className="App">
      <div className="Wrapper">
        <Header />
        <h2>Mixologists</h2>
        {mixologists.map(mixologist => (
// {
             <Mixologist 
            key={mixologist.id}
            mixologistId={mixologist.id} 
          />
        ))}

        {/* // <NewDrink onAddDrink={handleAddDrink} mixologists={mixologists} />
//         <NewMixologist onAddMixologist={handleAddMixologist} />  */}

{/* //         <DrinkList 
//           drinks={drinks}
//           mixologists={mixologists}
//           onAddDrink={handleAddDrink}
//           onUpdateDrink={handleUpdateDrink} 
//           onDeleteDrink={handleDeleteDrink} 
//         />   */}
      </div>       
    </div>
  )
}

export default App;


🗑 trash icon

#### Search.js (deleted)
import {useState} from 'react'

export default function Search(){
  return(
    <div >
      <form> 
        <label>🔍
<input className="Search"
  // onChange={e => setSearch(e.target.value)} 
  placeholder="Search drinks..."
  type="text"
  // value={name}
  // className="form-input"
/>
</label>
      </form>
    </div>
  )
}

// <form onSubmit={handleSubmit}>
{/* <label className="label">Name 
<input 
  onChange={e => setName(e.target.value)} 
  placeholder="Drink name"
  type="text"
  value={name}
  className="form-input"
/>
</label> */}