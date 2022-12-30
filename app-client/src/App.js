import React, { useEffect, useState } from "react";

import Header from "./Header";
// import Search from "./Search";
import DrinkList from "./DrinkList";
import NewDrink from "./NewDrink";
import './App.css';

function App() {
  const [drinks, setDrinks] = useState([]);
//   // const [search, setSearch] = useState("")

  useEffect(() => {
    fetch("http://localhost:9292/drinks")
    .then(r => r.json())
    .then(drinks => setDrinks(drinks));
  }, []);

  function handleAddDrink(newDrink) {
    setDrinks([...drinks, newDrink]);
  }

  function handleDeleteDrink(id){
    const updatedDrinks = drinks.filter(drink => drink.id !== id);
    setDrinks(updatedDrinks)
  }

  return (
    <div className="App">
      <Header />
      {/* <Search /> */}
      <NewDrink onAddDrink={handleAddDrink}/>
      <DrinkList 
        drinks={drinks}
        onDrinkDelete={handleDeleteDrink}  
      />
    </div>
  );
}

export default App;
