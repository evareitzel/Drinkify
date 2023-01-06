import React, { useEffect, useState } from "react";

import Header from "./Header"
import DrinkList from "./DrinkList";
import NewDrink from "./NewDrink";
import NewMixologist from "./NewMixologist";


import './App.css'

// const currentUser = { username: "Asa" }
// testUser = ...

function App() {
  const [users, setUsers] = useState([]);
  const [drinks, setDrinks] = useState([]);

  useEffect(() => {
    fetch("http://localhost:9292/users")
    .then(r => r.json())
    .then(users => setUsers(users));
  }, []);
  console.log(users)

    // <Filter.js> filter - show user's drinkList. (or similar)

  useEffect(() => {
    fetch("http://localhost:9292/drinks")
    .then(r => r.json())
    .then(drinks => setDrinks(drinks));
  }, []);
  // console.log(drinks)

  function handleAddMixologist(newMixologist){
    setUsers([...users, newMixologist])
  }

  function handleAddDrink(newDrink) {
    setDrinks([...drinks, newDrink])
  }

  function handleUpdateDrink(updatedDrink){
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
    const updatedDrinks = drinks.filter(drink => drink.id !== id);
    setDrinks(updatedDrinks)
  }  

  // const displayedDrinks = drinks.filter(drink => 
  //   // message.body.toLowerCase().includes(search.toLowerCase())
  //   drink.owner.toLowerCase().includes(currentUser.tolowercase())  
  // )

  // authors?

  // const displayedDrinks = drinks.filter(drink => ( 
  // drink.user_id === search
  // ))  
  
  return (
    <div className="App">
      <div className="Wrapper">
      <Header />
        {/* <Search /> */}
      <DrinkList 
        drinks={drinks}
        users={users}
        // username={name}  // const {name} = user
        // currentUser={testUser}
        onAddDrink={handleAddDrink}
        onUpdateDrink={handleUpdateDrink} 
        onDeleteDrink={handleDeleteDrink} 
      />

        <NewDrink onAddDrink={handleAddDrink} users={users} /> 
        <NewMixologist onAddMixologist={handleAddMixologist} /> 
        
      </div>      
    </div>
  );
}

export default App;
