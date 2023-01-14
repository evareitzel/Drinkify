import React, {useEffect, useState} from "react"
import Drink from "./Drink"

export default function Mixologist({ mixologistObj, onUpdateDrink }) { // mixologistId
  
  const drinksArr = mixologistObj.drinks
  // const drinks = mixologistObj
  // const [mixologist, setMixologist] = useState([])

  // remove state
  const [drinks, setDrinks] = useState([])
  const [cards, setCards] = useState(false)

  // setMixologist(mixologist)
  //     setDrinks(mixologist.drinks)
  // no fetch, get data from mixol
  // useEffect(() => {
  //   fetch(`http://localhost:9292/mixologists/${mixologistId}`)
  //   .then(r => r.json())
  //   .then(mixologist => {
  //     setMixologist(mixologist)
  //     setDrinks(mixologist.drinks)
  //   })
  // }, [mixologistId])

  ////

  const renderDrinks = drinksArr.map(drink => {
  // const renderDrinks = drinks.map(drink => {
    return <Drink 
      key={drink.id} 
      drink={drink} 
      onUpdateDrink={onUpdateDrink}
      onDeleteDrink={handleDeleteDrink}
      mixologist={mixologistObj}
    />
  })
  
  const showCards = 
  cards 
  ? renderDrinks
  : null 
  // <p>{mixologist.name} has no drinks yet!</p> // add drink btn

  // MOVED TO App.js ---->
  // function handleUpdateDrink(updatedDrink){
  //   console.log(updatedDrink)
  //   // const updatedDrinks = drinks.map(drink => {
  //   const updatedDrinks = drinksArr.map(drink => {
  //     if(drink.id === updatedDrink.id){
  //       return updatedDrink
  //     }else{
  //       return drink
  //     }
  //   })
  // }
  // <---- MOVED TO App.js

  function handleDeleteDrink(id){
    const updatedDrinks = drinks.filter(drink => drink.id !== id)
    setDrinks(updatedDrinks) // move state change to App.js
  }  

  return(
    <div>
      <a className="App-link" onClick={() => setCards(!cards)}>
        {mixologistObj.name} {/* mixologist */}
        {cards ? ' 🡨' : ' 🡪'}
      </a>
      {showCards}
    </div>
  )
}
