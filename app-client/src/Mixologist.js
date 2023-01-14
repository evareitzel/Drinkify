import React, {useEffect, useState} from "react"
import Drink from "./Drink"

export default function Mixologist({ mixologistObj, onUpdateDrink }) {
  
  // remove state
  const [cards, setCards] = useState(false)

  const drinksArr = mixologistObj.drinks

  const renderDrinks = drinksArr.map(drink => {
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


  // Fix DESTROY action
  // Fetch Delete is wkg
  function handleDeleteDrink(id){
    const updatedDrinks = drinksArr.filter(drink => drink.id !== id)
  }  

  return(
    <div>
      <a className="App-link" onClick={() => setCards(!cards)}>
        {mixologistObj.name}
        {cards ? ' 🡨' : ' 🡪'}
      </a>
      {showCards}
    </div>
  )
}
