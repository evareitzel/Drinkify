import React, { useEffect, useState } from "react";

import Header from "./Header";
// import Search from "./Search";
import DrinkList from "./DrinkList";
import NewDrink from "./NewDrink";
import './App.css';

function App() {

  // darkmode
  const [drinks, setDrinks] = useState([]);
//   // const [search, setSearch] = useState("")

  useEffect(() => {
    fetch("http://localhost:9292/drinks")
    .then(r => r.json()) // (r)
    .then(drinks => setDrinks(drinks)); // (drinks)
  }, []);

  return (
    <div className="App">
      <Header />
      {/* <Search /> */}
      <NewDrink />
      <DrinkList drinks={drinks}/>
    </div>
  );
}

export default App;
