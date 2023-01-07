import React, { useEffect, useState } from "react";

import Header from "./Header"
import DrinkList from "./DrinkList";
import NewDrink from "./NewDrink";
import NewMixologist from "./NewMixologist";


import './App.css'

function App() {
  const [users, setUsers] = useState([]);
  const [drinks, setDrinks] = useState([]);

  useEffect(() => {
    fetch("http://localhost:9292/users")
    .then(r => r.json())
    .then(users => setUsers(users));
  }, []);
  console.log(users)

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
  
  return (
    <div className="App">
      <div className="Wrapper">
      <Header />
      <DrinkList 
        drinks={drinks}
        users={users}
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
