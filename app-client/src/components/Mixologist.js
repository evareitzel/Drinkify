import React, {useEffect, useState} from "react"
import Drink from "./Drink"

export default function Mixologist({ mixologist, onUpdateDrink, onDeleteDrink }) {
  
  // remove state
  const [cards, setCards] = useState(false)

  const drinks = mixologist.drinks

  const renderDrinks = drinks.map(drink => {
    return <Drink 
      key={drink.id} 
      drink={drink} 
      onUpdateDrink={onUpdateDrink}
      onDeleteDrink={onDeleteDrink}
      mixologist={mixologist}
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
        {mixologist.name}
        {cards ? ' 🡨' : ' 🡪'}
      </a>
      {showCards}
    </div>
  )
}
