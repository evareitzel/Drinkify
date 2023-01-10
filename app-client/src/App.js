import React, { useEffect, useState } from "react"

import Header from "./Header"
import Mixologist from "./Mixologist"
import DrinkList from "./DrinkList"
import NewDrink from "./NewDrink"
import NewMixologist from "./NewMixologist"
import "./App.css"

function App() {
  const [mixologists, setMixologists] = useState([])
  const [drinks, setDrinks] = useState([])
  // const [latestDrinks, setLatestDrinks] = useState([])

  useEffect(() => {
    fetch("http://localhost:9292/mixologists")    
    .then(r => r.json())
    .then(mixologists => setMixologists(mixologists))
  }, [])
  // console.log(mixologists)

  // HERE ********** - wkg on getting mixologistId fo Mixologist component
  // console.log(mixologists.map(mixologist => {
  //     mixologist.id
  //   })) 


  useEffect(() => {
    fetch("http://localhost:9292/drinks")
    .then(r => r.json())
    .then(drinks => setDrinks(drinks))
  }, [])

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
  {console.log(mixologists)}

  return (
    <div className="App">
      <div className="Wrapper">
      <Header />
      <h2>Mixologists</h2>
      {mixologists.map(mixologist => (
          <Mixologist 
            key={mixologist.id}
            mixologistId={mixologist.id} 
          />
      ))}
        
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
