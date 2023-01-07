import React, { useEffect, useState } from "react"

import Header from "./Header"
import DrinkList from "./DrinkList"
import NewDrink from "./NewDrink"
import NewMixologist from "./NewMixologist"
import "./App.css"

function App() {
  const [mixologists, setMixologists] = useState([])
  const [drinks, setDrinks] = useState([])

  //// START Mixologists w Drinks data
  const [mixologistsWithDrinks, setMixologistsWithDrinks] = useState([])

  
  useEffect(() => {
    fetch("http://localhost:9292/mixologists")    
    .then(r => r.json())
    .then(mixologistsWithDrinks => setMixologistsWithDrinks(mixologistsWithDrinks))
  }, [])
  // console.log(`mixologistsWithDrinks: ${mixologistsWithDrinks}`)
  // debugger
  // console.log(mixologistsWithDrinks)
  console.log(mixologistsWithDrinks[0])
  // [drinks]


  //// END Mixologists w Drinks data

  useEffect(() => {
    fetch("http://localhost:9292/mixologists")    
    .then(r => r.json())
    .then(mixologists => setMixologists(mixologists))
  }, [])

  useEffect(() => {
    fetch("http://localhost:9292/drinks")
    .then(r => r.json())
    .then(drinks => setDrinks(drinks))
  }, [])
  // console.log(drinks)
  console.log(mixologists)
  // console.log(mixologists[0])

  function handleAddMixologist(newMixologist){
    setMixologists([...mixologists, newMixologist])
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
    const updatedDrinks = drinks.filter(drink => drink.id !== id)
    setDrinks(updatedDrinks)
  }  
  
  return (
    <div className="App">
      <div className="Wrapper">
      <Header />
      {/* <Mixologist/> */}
      <DrinkList 
        drinks={drinks}
        mixologists={mixologists}
        onAddDrink={handleAddDrink}
        onUpdateDrink={handleUpdateDrink} 
        onDeleteDrink={handleDeleteDrink} 
      />

      <NewDrink onAddDrink={handleAddDrink} mixologists={mixologists} />  
      <NewMixologist onAddMixologist={handleAddMixologist} /> 
        
      </div>      
    </div>
  )
}

export default App;
