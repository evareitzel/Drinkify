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
