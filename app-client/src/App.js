import React, { useEffect, useState } from "react"

import Header from "./Header"
import Mixologist from "./Mixologist"
import NewDrink from "./NewDrink"
import NewMixologist from "./NewMixologist"
import "./App.css"

export default function App() {
  const [mixologists, setMixologists] = useState([])
  const [latestDrinks, setLatestDrinks] = useState([])

  useEffect(() => {
    fetch("http://localhost:9292/mixologists")    
    .then(r => r.json())
    .then(mixologists => setMixologists(mixologists))
  }, [])

  useEffect(() => {
    fetch("http://localhost:9292/drinks")
    .then(r => r.json())
    .then(latestDrinks => setLatestDrinks(latestDrinks))
  }, [])
  // console.log(latestDrinks)

  const renderMixologists = mixologists.map(mixologist => (
    <Mixologist 
      key={mixologist.id}
      mixologistId={mixologist.id}      
      mixologistObj = {mixologist}
      onUpdateDrink={handleUpdateDrink}

    />
  ))

  ////////////
  function handleUpdateDrink(updatedDrink){
    const found = mixologists.find(mixologist => (
      mixologist.id == updatedDrink.mixologist_id
    ))
    
    const updatedDrinks = found.drinks.map(drink => (
      drink.id === updatedDrink.id ? updatedDrink : drink
    ))
    console.log(updatedDrinks) // wkg

    // const updatedMixologists = 
    // mixologists.find(mixologist => {

    // })
    //   if
    //   ...
    console.log(found)

    const updatedMixologists = mixologists.map(mixologist => {
      if(mixologist.id == found.id){
        mixologist.drinks = updatedDrinks
        return mixologist
      }else{
        return mixologist
      }
    })
    console.log(updatedMixologists)

    setMixologists(updatedMixologists)// set state
  }
  // const updatedMixologist = () => {found.drinks === updatedDrinks}
    // console.log(updatedMixologist)

    // const updatedMixologist = mixologists.find(mixologist => mixologist === found) // (mixologist.id === found.id){
        // update nested drinks obj and return mixologist?       
      // }
      // drinks = updatedDrinks
    // console.log(updatedMixologist) // NOT LOGGING TO CONSOLE


  function handleAddMixologist(newMixologist){
    setMixologists([...mixologists, newMixologist])
  }

  return (
    <div className="App">
      <div className="Wrapper">
        <Header />
        <h2>Mixologists</h2>
        {renderMixologists}
        {/* <NewDrink mixologists={mixologists} onAddDrink={handleAddDrink} />  */}
        <NewMixologist onAddMixologist={handleAddMixologist} />
      </div>
    </div>
  )}

    // function handleAddDrink(newDrink) {
  //   setDrinks([...drinks, newDrink])
  // }
