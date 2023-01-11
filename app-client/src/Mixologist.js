import React, {useEffect, useState} from "react"
import Drink from "./Drink"


export default function Mixologist({ mixologistId, onDeleteDrink }){
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

const renderDrinks = drinks.map(drink => {
  return <Drink 
    key={drink.id} 
    drink={drink} 
    onUpdateDrink={handleUpdateDrink}
    // onDeleteDrink={onDeleteDrink}
    mixologist={mixologist}
  />
})
  
  const showCards = 
  cards 
  ? renderDrinks
  : null

  function handleUpdateDrink(updatedDrink){
    console.log(updatedDrink)
    const updatedDrinks = drinks.map(drink => {
    if(drink.id === updatedDrink.id){
      return updatedDrink
    }else{
      return drink
    }
  })
    setDrinks(updatedDrinks)
  }

  return(
    <div>
      <a className="App-link" onClick={() => setCards(!cards)}>
        {mixologist.name}
      </a>
      {showCards}
    </div>
  )
}
