import React, {useEffect, useState} from "react"
import Drink from "./Drink"

export default function Mixologist({ mixologistId }){
  const [mixologist, setMixologist] = useState([])

  // remove state
  const [drinks, setDrinks] = useState([])
  const [cards, setCards] = useState(false)

  // no fetch, get data from mixol
  useEffect(() => {
    fetch(`http://localhost:9292/mixologists/${mixologistId}`)
    .then(r => r.json())
    .then(mixologist => {
      setMixologist(mixologist)
      setDrinks(mixologist.drinks)
    })
  }, [mixologistId])

  ////
const renderDrinks = drinks.map(drink => {
  return <Drink 
    key={drink.id} 
    drink={drink} 
    onUpdateDrink={handleUpdateDrink}
    onDeleteDrink={handleDeleteDrink}
    mixologist={mixologist}
  />
})
  
  const showCards = 
  cards 
  ? renderDrinks
  : null 
  // <p>{mixologist.name} has no drinks yet!</p> // add drink btn

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

  function handleDeleteDrink(id){
    const updatedDrinks = drinks.filter(drink => drink.id !== id)
    setDrinks(updatedDrinks)
  }  

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
