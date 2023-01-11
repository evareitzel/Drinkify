import React, {useEffect, useState} from "react"
import Drink from "./Drink"


export default function Mixologist({ mixologistId, onUpdateDrink, onDeleteDrink }){
  const [mixologist, setMixologist] = useState([])
  const [drinks, setDrinks] = useState([])
  const [cards, setCards] = useState(false)

  useEffect(() => {
    fetch(`http://localhost:9292/mixologists/${mixologistId}`)
    .then(r => r.json())
    .then(mixologist => {
      setMixologist(mixologist)
      setDrinks(mixologist.drinks)
    })
  }, [mixologistId])

// console.log(drinks)

const renderDrinks = drinks.map(drink => {
  return <Drink 
    key={drink.id} 
    drink={drink} 
    // onUpdateDrink={onUpdateDrink}
    // onDeleteDrink={onDeleteDrink}
    mixologist={mixologist}
  />
})
  
  const showCards = 
  !cards 
  ? null
  : renderDrinks

  return(
    <div>
      {/* <a className="App-link" onClick={handleMixologistClick}> */}
      <a className="App-link" onClick={() => setCards(!cards)}>
        {mixologist.name}
      </a>
      {showCards}
    </div>
  )
}
