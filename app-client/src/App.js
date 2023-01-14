import React, { useEffect, useState } from "react"

import Header from "./Header"
import Mixologist from "./Mixologist"
import NewDrink from "./NewDrink"
import NewMixologist from "./NewMixologist"
import "./App.css"

export default function App() {
  const [mixologists, setMixologists] = useState([])
  const [latestDrinks, setLatestDrinks] = useState([])
  // console.log(mixologists)

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
  // console.log(mixologists[1])

  const renderMixologists = mixologists.map(mixologist => (
    <Mixologist 
      key={mixologist.id}
      mixologistId={mixologist.id}      
      mixologistObj = {mixologist} // 1/12
      onUpdateDrink={handleUpdateDrink}

    />
  ))

  function handleUpdateDrink(updatedDrink){

    // console.log(updatedDrink) // wkg

    // find mixologist with matching ID
    const found = mixologists.find(mixologist => (
      mixologist.id == updatedDrink.mixologist_id
    ))

    // console.log(found) // wkg
    
    // variable assignment necessary?
    const updatedDrinks = found.drinks.map(drink => { // mixologist
    // // const updatedDrinks = drinks.map(drink => {
      if(drink.id === updatedDrink.id){
        return updatedDrink
      }else{
        return drink
      }
    })

    console.log(updatedDrinks) // wkg

    // update mixologists arr
    const updatedMixologist = mixologists.found.drinks = updatedDrinks

    const updatedMixologists = mixologists.map(mixologist => {
      if(mixologist.id == found.id){
        return updatedMixologist
      }else{
        return mixologist
      }
    })

    // NOT LOGGING TO CONSOLE
    console.log(updatedMixologist)

    console.log(`updatedMixologists: #{updatedMixologists}`)
    console.log(updatedMixologists)



    // set state
    setMixologists(updatedMixologists)

    // to update state:
      // in mixologists, find mixologist w matching ID
      // replace the mixologist's drinks array
      // setMixologists() with updated arr
  }

  // console.log(updatedDrink) 
    // is drink passing mixologist id? 
      // can drink access mixologist id? (ex: drink.mixologist_id)
      // could this be an opportunity for writing an instance method in Drink class (ex: updatedDrink.mixologist - gets mixologist obj associated with foreign key)
// Pseudocode for handleUpdateDrink
// mixologists.map(mixologist => 
// find mixologist with matching ID from edited drink
 // 
// find mixologist's drink matching edited drink (id?)
// if the drink matches, update drink data
// else return existing drink
// update mixologist state containing drinks hash

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

  // From Mixologist.js
      // setDrinks(updatedDrinks) // add to state in App.js? not updating UI
    // // rendering from drinksArr, not Mixologist drinks state anymore...