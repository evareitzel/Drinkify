import React, { useEffect, useState } from "react";

import Header from "./Header"
import User from "./User"
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
  // console.log(users)

  // display only users 
    // click user to show user's drinkList. (or similar)

  useEffect(() => {
    fetch("http://localhost:9292/drinks")
    .then(r => r.json())
    .then(drinks => setDrinks(drinks));
  }, []);
  // console.log(drinks)

  function handleAddDrink(newDrink) {
    setDrinks([...drinks, newDrink]);
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
  
  return (
    <div className="App">
      <div className="Wrapper">
      <Header />
        {/* <Search /> */}
        {users.map(user => (
          <User
            user={user}
            drinks={drinks} // displayedDrinks
            onAddDrink={handleAddDrink}        
            onUpdateDrink={handleUpdateDrink} 
            onDeleteDrink={handleDeleteDrink} 
          />
        ))}

      </div>      
    </div>
  );
}

export default App;
