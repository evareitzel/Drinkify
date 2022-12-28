import React, { useEffect, useState } from "react";
import Header from "./Header";//unghost
// import Search from "./Search";
import DrinkList from "./DrinkList";
// import NewDrink from "./NewDrink";

function App() {
  // darkmode
  const [drinks, setDrinks] = useState([]);
  // const [search, setSearch] = useState("")

  useEffect(() => {
    fetch("http://localhost:9292/drinks")
    .then(r => r.json()) // (r)
    .then(drinks => setDrinks(drinks)); // (drinks)
  }, []);

  // console.log('hi from App component!')

  return (
    // <div className="App">
    //   <header className="App-header">

    <>
      <Header />
      <DrinkList drinks={drinks} />
    </>

// <Search />
          // {/* <NewDrink /> */}

    // </div>
  );
}

export default App;
