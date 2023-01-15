import React, {useEffect, useState} from "react"
import Drink from "./Drink"

export default function Mixologist({ mixologistObj, onUpdateDrink, onDeleteDrink }) {
  
  // remove state
  const [cards, setCards] = useState(false)

  const drinksArr = mixologistObj.drinks

  const renderDrinks = drinksArr.map(drink => {
    return <Drink 
      key={drink.id} 
      drink={drink} 
      onUpdateDrink={onUpdateDrink}
      onDeleteDrink={onDeleteDrink}
      mixologist={mixologistObj}
    />
  })
  
  const showCards = 
  cards 
  ? renderDrinks
  : null 
  // <p>{mixologist.name} has no drinks yet!</p> // add drink btn

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
