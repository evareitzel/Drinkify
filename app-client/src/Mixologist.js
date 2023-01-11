import React, {useEffect, useState} from "react"
import Drink from "./Drink"


export default function Mixologist({ mixologistId, onUpdateDrink, onDeleteDrink }){
  const [mixologist, setMixologist] = useState([])
  const [drinks, setDrinks] = useState([])

  useEffect(() => {
    fetch(`http://localhost:9292/mixologists/${mixologistId}`)
    .then(r => r.json())
    .then(mixologist => {
      setMixologist(mixologist)
      setDrinks(mixologist.drinks)
    })
    // .then(mixologist => setDrinks(mixologist.drinks))
  }, [mixologistId])

console.log(drinks)

  function handleMixologistClick(e){
    console.log(`${mixologist.name}} got clicked!`)
  }
  
  const renderDrinks = 
    drinks.map(drink => {
      return <Drink 
        key={drink.id} 
        drink={drink} 
      //   // onUpdateDrink={onUpdateDrink}
      //   // onDeleteDrink={onDeleteDrink}
        mixologist={mixologist}
      />
    })

  return(
    <div>
      <a className="App-link" onClick={handleMixologistClick}>
        {mixologist.name}
      </a>
      {renderDrinks}
    </div>
  )
}
