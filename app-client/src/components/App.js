import React, { useEffect, useState } from "react";
import Header from "./Header";//unghost
import Search from "./Search";
import DrinkList from "./DrinkList";
import NewDrink from "./NewDrink";

function App() {
  // darkmode
  const [drinks, setDrinks] = useState([]);
  // const [search, setSearch] = useState("")

  useEffect(() => {
    fetch("http://localhost:9292/drinks")
    .then(r => r.json()) // (r)
    .then(drinks => setDrinks(drinks)); // (drinks)
  }, []);


  return (
    // <div className="App">
    //   <header className="App-header">
    <Header />
    <Search />
    <DrinkList />
    <NewDrink />
        // <p>
        //   Edit <code>src/App.js</code> and save to reload.
        // </p>
        // <a
        //   className="App-link"
        //   href="https://reactjs.org"
        //   target="_blank"
        //   rel="noopener noreferrer"
        // >
        //   Learn React
        // </a>
    //   </header>
    // </div>
  );
}

export default App;
