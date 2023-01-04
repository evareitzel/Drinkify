import React from "react";
import Drink from "./Drink";

export default function DrinkList({drinks, onDrinkDelete, onUpdateDrink}){
  return(
    <div >
      <h2>Drinks</h2>
        {drinks.map(drink => (
          <Drink 
            key={drink.id} 
            drink={drink} 
            onDrinkDelete={onDrinkDelete}
            onUpdateDrink={onUpdateDrink}
          />
        ))}
    </div>
  )
}